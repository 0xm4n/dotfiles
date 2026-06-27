#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
TARGET_HOME="${DOTFILES_HOME:-$HOME}"
BACKUP_ROOT="${DOTFILES_BACKUP_DIR:-$TARGET_HOME/.dotfiles-backups/$(date +%Y%m%d-%H%M%S)}"

DRY_RUN=0
INSTALL_PLUGINS=1
CHANGE_SHELL=1
START_ZSH=1
BACKUP_CREATED=0

usage() {
    cat <<'EOF'
Usage: bash install.sh [options]

Options:
  --dry-run        Print the actions without changing files.
  --skip-plugins   Skip network-dependent plugin installation and updates.
  --no-chsh        Do not change the default shell to zsh.
  --no-exec        Do not start zsh after installation.
  -h, --help       Show this help message.

Environment:
  DOTFILES_HOME        Target home directory. Defaults to $HOME.
  DOTFILES_BACKUP_DIR  Backup directory. Defaults to ~/.dotfiles-backups/<timestamp>.
EOF
}

log() {
    printf '[info] %s\n' "$*"
}

warn() {
    printf '[warn] %s\n' "$*" >&2
}

die() {
    printf '[error] %s\n' "$*" >&2
    exit 1
}

run() {
    if [[ "$DRY_RUN" -eq 1 ]]; then
        printf '+'
        printf ' %q' "$@"
        printf '\n'
        return 0
    fi

    "$@"
}

on_error() {
    local line=$1
    die "Install failed at line $line."
}
trap 'on_error "$LINENO"' ERR

while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run)
            DRY_RUN=1
            ;;
        --skip-plugins)
            INSTALL_PLUGINS=0
            ;;
        --no-chsh)
            CHANGE_SHELL=0
            ;;
        --no-exec)
            START_ZSH=0
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            die "Unknown option: $1"
            ;;
    esac
    shift
done

if [[ "$TARGET_HOME" != "$HOME" ]]; then
    CHANGE_SHELL=0
    START_ZSH=0
fi

require_cmd() {
    local cmd=$1

    if ! command -v "$cmd" >/dev/null 2>&1; then
        die "Required command '$cmd' is not installed."
    fi

    log "Found $cmd: $(command -v "$cmd")"
}

ensure_dir() {
    local dir=$1

    if [[ -d "$dir" ]]; then
        return 0
    fi

    if [[ -e "$dir" || -L "$dir" ]]; then
        warn "$dir exists but is not a directory; backing it up"
        backup_path "$dir"
    fi

    log "Creating $dir"
    run mkdir -p "$dir"
}

backup_path() {
    local target=$1

    if [[ ! -e "$target" && ! -L "$target" ]]; then
        return 0
    fi

    local prefix="${TARGET_HOME%/}/"
    local rel="${target#$prefix}"

    if [[ "$rel" == "$target" ]]; then
        rel="$(basename "$target")"
    fi

    local backup="$BACKUP_ROOT/$rel"

    if [[ -e "$backup" || -L "$backup" ]]; then
        local i=1
        while [[ -e "$backup.$i" || -L "$backup.$i" ]]; do
            i=$((i + 1))
        done
        backup="$backup.$i"
    fi

    ensure_dir "$(dirname "$backup")"

    log "Backing up $target to $backup"
    run mv "$target" "$backup"
    BACKUP_CREATED=1
}

install_file() {
    local src=$1
    local dest=$2

    [[ -f "$src" ]] || die "Missing source file: $src"

    if [[ -f "$dest" && -f "$src" ]] && cmp -s "$src" "$dest"; then
        log "$dest is already up to date"
        return 0
    fi

    backup_path "$dest"
    ensure_dir "$(dirname "$dest")"

    log "Installing $dest"
    run cp "$src" "$dest"
}

clone_or_update() {
    local repo=$1
    local dest=$2

    if [[ "$INSTALL_PLUGINS" -eq 0 ]]; then
        log "Skipping plugin repo $repo"
        return 0
    fi

    if [[ -d "$dest/.git" ]]; then
        log "Updating $dest"
        if ! run git -C "$dest" pull --ff-only; then
            warn "Failed to update $dest; leaving the existing copy in place"
        fi
        return 0
    fi

    if [[ -e "$dest" || -L "$dest" ]]; then
        warn "$dest exists but is not a git repository; backing it up before clone"
        backup_path "$dest"
    fi

    ensure_dir "$(dirname "$dest")"
    log "Cloning $repo into $dest"
    if ! run git clone "$repo" "$dest"; then
        warn "Failed to clone $repo; continuing without it"
    fi
}

install_zsh_config() {
    local zsh_dir="$TARGET_HOME/.config/zsh"

    ensure_dir "$zsh_dir"
    install_file "$SCRIPT_DIR/.zshrc" "$TARGET_HOME/.zshrc"

    for file in "$SCRIPT_DIR"/.config/zsh/*.zsh; do
        install_file "$file" "$zsh_dir/$(basename "$file")"
    done

    clone_or_update \
        "https://github.com/zsh-users/zsh-autosuggestions" \
        "$zsh_dir/zsh-autosuggestions"
    clone_or_update \
        "https://github.com/zsh-users/zsh-syntax-highlighting.git" \
        "$zsh_dir/zsh-syntax-highlighting"
}

install_tmux_plugins() {
    local tpm_dir="$TARGET_HOME/.tmux/plugins/tpm"

    clone_or_update "https://github.com/tmux-plugins/tpm" "$tpm_dir"

    if [[ "$INSTALL_PLUGINS" -eq 0 ]]; then
        return 0
    fi

    if [[ ! -x "$tpm_dir/bin/install_plugins" ]]; then
        warn "TPM installer not found at $tpm_dir/bin/install_plugins"
        return 0
    fi

    log "Installing tmux plugins through TPM"
    if ! run bash "$tpm_dir/bin/install_plugins"; then
        warn "TPM plugin installation failed; tmux config was still installed"
    fi
}

zsh_plugins_ready() {
    [[ -f "$TARGET_HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
        [[ -f "$TARGET_HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]
}

change_default_shell() {
    local zsh_path
    zsh_path="$(command -v zsh)"

    if [[ "$CHANGE_SHELL" -eq 0 ]]; then
        log "Skipping default shell change"
        return 0
    fi

    if [[ "${SHELL:-}" == "$zsh_path" ]]; then
        log "Default shell is already $zsh_path"
        return 0
    fi

    if ! zsh_plugins_ready; then
        warn "zsh plugins are missing; skipping chsh to avoid a broken login shell"
        warn "Run the installer again without --skip-plugins after network access is available."
        return 0
    fi

    if [[ -r /etc/shells ]] && ! grep -qx "$zsh_path" /etc/shells; then
        warn "$zsh_path is not listed in /etc/shells; skipping chsh"
        warn "Add it to /etc/shells first if you want to make it the login shell."
        return 0
    fi

    if [[ ! -t 0 ]]; then
        warn "Non-interactive terminal detected; skipping chsh"
        warn "Run 'chsh -s $zsh_path' manually if needed."
        return 0
    fi

    log "Changing default shell to $zsh_path"
    if ! run chsh -s "$zsh_path"; then
        warn "chsh failed; run 'chsh -s $zsh_path' manually if needed"
    fi
}

start_zsh() {
    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "Dry run enabled; skipping zsh startup"
        return 0
    fi

    if [[ "$START_ZSH" -eq 0 ]]; then
        log "Skipping zsh startup"
        return 0
    fi

    if [[ ! -t 1 ]]; then
        log "Skipping zsh startup in non-interactive output"
        return 0
    fi

    if ! zsh_plugins_ready; then
        warn "zsh plugins are missing; skipping zsh startup"
        warn "Run the installer again without --skip-plugins after network access is available."
        return 0
    fi

    log "Starting zsh"
    exec zsh
}

main() {
    log "Installing dotfiles from $SCRIPT_DIR"
    log "Target home: $TARGET_HOME"

    require_cmd git
    require_cmd zsh
    require_cmd vim
    require_cmd tmux

    if ! command -v xclip >/dev/null 2>&1; then
        warn "xclip is not installed; tmux clipboard copy may not work on Linux."
    fi

    ensure_dir "$TARGET_HOME/.config"

    install_file "$SCRIPT_DIR/.vimrc" "$TARGET_HOME/.vimrc"
    install_zsh_config

    install_file "$SCRIPT_DIR/.tmux.conf" "$TARGET_HOME/.tmux.conf"
    install_tmux_plugins

    if [[ "$BACKUP_CREATED" -eq 1 ]]; then
        log "Backups stored in $BACKUP_ROOT"
    else
        log "No backups were needed"
    fi

    change_default_shell
    log "Install completed"
    start_zsh
}

main

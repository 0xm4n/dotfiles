# 0xm4n dotfiles

[![GitHub stars](https://img.shields.io/github/stars/0xm4n/dotfiles?style=social)](https://github.com/0xm4n/dotfiles/stargazers)
[![Last commit](https://img.shields.io/github/last-commit/0xm4n/dotfiles)](https://github.com/0xm4n/dotfiles/commits/main)
[![Repo size](https://img.shields.io/github/repo-size/0xm4n/dotfiles)](https://github.com/0xm4n/dotfiles)

Keyboard-first dotfiles for developers who live in **tmux**, **Neovim**,
**zsh**, terminal emulators, and tiling window managers.

This repo is built around one idea: keep your hands on the keyboard and use
the same navigation model everywhere. The configs connect shell, editor,
terminal, tmux, window manager, and keyboard remapping into one portable
workflow across macOS, Linux, and Windows.

If this helps you build a faster terminal setup, a star makes the project
easier for other keyboard-driven developers to find.

## Highlights

- **Cross-platform keyboard layer** - Caps Lock becomes Esc when tapped and a
  navigation/control layer when held, with implementations for Karabiner,
  keyd, and AutoHotkey.
- **tmux + Neovim muscle memory** - `Ctrl-h/j/k/l` moves between tmux panes and
  Neovim splits with the same keys.
- **Terminal-first editing setup** - Neovim powered by `lazy.nvim`, Telescope,
  fzf-lua, Treesitter, LSP, completion, Git integration, DAP, quickfix helpers,
  and OSC52 clipboard copy.
- **Productive zsh defaults** - aliases, shared history, autosuggestions,
  syntax highlighting, prompt, and shell options tuned for daily use.
- **Opinionated terminal visuals** - Alacritty and Kitty configs using Hack
  Nerd Font Mono, large scrollback, true color, and Sonokai-like colors.
- **Tiling window workflow** - yabai and skhd configs for keyboard-focused
  window navigation on macOS.

## What's Inside

| Area | Files | What it gives you |
| --- | --- | --- |
| Shell | `.zshrc`, `.config/zsh/*` | aliases, history, prompt, plugins, env |
| Editor | `.config/nvim/*`, `.vimrc` | Neovim IDE setup plus classic Vim config |
| Terminal multiplexer | `.tmux.conf` | vi mode, plugins, pane navigation, copy mode |
| Terminal emulators | `.config/alacritty/*`, `.config/kitty/*` | fonts, colors, keymaps, clipboard behavior |
| Keyboard layer | `.config/karabiner.edn`, `.config/keyd/default.conf`, `.config/autohotkey/remap.ahk` | macOS, Linux, and Windows remaps |
| Window manager | `.config/yabai/yabairc`, `.config/skhd/skhdrc` | tiling layout and window shortcuts |
| Git and profile | `.gitconfig`, `.zprofile` | Git LFS/network tuning and shell startup limits |
| Scripts | `install.sh`, `script/wiggle-all` | bootstrap core configs and resolve patch rejects |

## Quick Start

Clone the repo:

```sh
git clone https://github.com/0xm4n/dotfiles.git
cd dotfiles
```

Run the bootstrap script if you want the core shell, Vim, and tmux setup:

```sh
bash install.sh
```

The script checks for `git`, `zsh`, `vim`, and `tmux`, backs up changed files
under `~/.dotfiles-backups/`, installs zsh plugins, installs tmux plugins
through TPM, and can change the default shell to zsh when it is safe to do so.

Useful install flags:

```sh
bash install.sh --dry-run
bash install.sh --skip-plugins
bash install.sh --no-chsh --no-exec
```

For the rest of the modules, inspect the files and copy or symlink only what
you want:

```sh
mkdir -p ~/.config
cp -R .config/nvim ~/.config/
cp -R .config/alacritty ~/.config/
cp -R .config/kitty ~/.config/
```

## Keyboard Layer

The keyboard layer is the most reusable part of this setup. It gives Caps Lock
a dual role:

- Tap `Caps Lock` for `Esc`.
- Hold `Caps Lock` to access arrows, Control shortcuts, delete, Enter, function
  keys, and Vim/tmux-friendly movement.
- Use the Alt/Command layer for paging, Home/End, and pane navigation.

### Caps Lock Layer

![Caps Lock keyboard layer](https://raw.githubusercontent.com/0xm4n/keyboard-extend-layer/main/extend-layer.png)

### Alt / Command Layer

![Alt and Command keyboard layer](https://raw.githubusercontent.com/0xm4n/keyboard-extend-layer/main/extend-layer2.png)

Platform implementations:

- macOS: [Karabiner / Goku](.config/karabiner.edn)
- Linux: [keyd](.config/keyd/default.conf)
- Windows: [AutoHotkey](.config/autohotkey/remap.ahk)

## Neovim Setup

This Neovim config is designed for fast project navigation and C/C++-friendly
development.

- Plugin manager: `lazy.nvim`
- Search/navigation: Telescope, frecency, fzf-lua, hop
- Language tooling: LSP, Mason, clangd, clangd extensions
- Completion: nvim-cmp with LSP, buffer, path sources, and lspkind icons
- Syntax/navigation: Treesitter, textobjects, context, Vista
- Git workflow: Fugitive, Gitsigns, Git Messenger
- Debugging: nvim-dap, dap-ui, virtual text
- UI: Sonokai, lualine, bufferline, nvim-tree, Trouble, barbecue
- Terminal workflow: toggleterm, vim-tmux-navigator, OSC52 clipboard copy

Useful bindings include:

| Action | Key |
| --- | --- |
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| Buffers | `<leader>fb` |
| Git status | `<leader>gs` |
| LSP symbols | `<leader>ls` |
| Rename symbol | `<leader>rn` |
| Add Harpoon mark | `<leader>ha` |
| Toggle NvimTree | `<leader>nn` |
| Copy through OSC52 | `<leader>y` |

## tmux Workflow

The tmux config is built for long-running terminal sessions:

- Prefix moved to `Ctrl-a`
- Windows and panes start at index 1
- Mouse support and vi-style copy mode
- Very large scrollback history
- Status bar with session list, CPU, RAM, and time
- Smart `Ctrl-h/j/k/l` pane navigation that cooperates with Vim/Neovim splits
- TPM plugins for yank, logging, prefix highlight, CPU, resurrect, continuum,
  copycat, sessionist, jump, and extrakto

## Requirements

Install the tools you plan to use:

- Core: `git`, `zsh`, `vim`, `tmux`
- Neovim: `nvim`, `rg`, a Nerd Font, language servers as needed
- tmux clipboard on Linux: `xclip`
- macOS window management: `yabai`, `skhd`
- Keyboard remap: Karabiner/Goku, keyd, or AutoHotkey depending on platform
- Terminal emulators: Alacritty or Kitty

## Good Fit

You will probably like this repo if you:

- prefer keyboard-driven workflows over mouse-heavy setups
- use Vim/Neovim and tmux every day
- want the same navigation habits across terminal, editor, and OS
- care about cross-platform keyboard remaps
- want a readable dotfiles repo to borrow from instead of a heavy framework

## Notes

These are personal dotfiles, so treat them as a well-tested starting point
rather than a universal distro. Read `install.sh` before running it, back up
important local config, and copy modules gradually.

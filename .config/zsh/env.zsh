# ZSH environment variables and options

export PATH=/usr/local/sbin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/sbin:$PATH

export TERM=xterm-256color

export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.zsh_history"

bindkey -e			# use emacs keybindings

setopt HIST_IGNORE_ALL_DUPS     # when runing a command several times, store one
setopt SHARE_HISTORY            # share history among sessions
setopt EXTENDED_HISTORY         # timestamp for each history entry
setopt INC_APPEND_HISTORY       # append to history once executed

setopt noautomenu
setopt nomenucomplete

# Set up the prompt
PROMPT="%{$fg_bold[green]%}%n@%M%{$fg[white]%}:%{$fg_bold[blue]%}%~%{$fg[white]%}%b$%{$reset_color%}"

# Colors
autoload -Uz colors && colors

# if we have a screen, we can try a colored screen
if [[ "$TERM" == "screen" ]]; then
    export TERM="screen-256color-bce"
fi
if [[ "$TERM" == "xterm" ]]; then
    export TERM="xterm-256color-bce"
fi

# Plugin
# source ~/antigen.zsh
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle jeffreytse/zsh-vi-mode
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen apply

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

setopt noautomenu
setopt nomenucomplete

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# alias
# edit rc
alias rc='nvim ~/.zshrc'
alias rcs='nvim ~/.zshrc && source ~/.zshrc'
alias tmux="TERM=screen-256color-bce tmux"

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# cd
alias ~='cd ~'
alias -- -="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls='ls -Fh --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias v='nvim'
alias g='git'
alias c='clear'
alias p="ps aux | grep "
alias h="history"
alias hgrep='history | grep'

# Tmux Clear pane
alias tc='clear; tmux clear-history; clear'

# debian and ubuntu specific aliases
## autocomplete-able apt-xxx aliases
if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    alias acs='apt-cache show'
    alias agi='sudo apt-get install'
    alias ag='sudo apt-get'
    alias agu='sudo apt-get update'
    alias agug='sudo apt-get upgrade'
    alias aguu='agu && agug'
    alias agr='sudo apt-get uninstall'
    alias agp='sudo apt-get purge'
    alias aga='sudo apt-get autoremove'
    alias ctl='sudo service '
    alias feierabend='sudo shutdown -h now'
fi

# executable search path
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH
# pip
export PATH=$PATH:~/.local/bin/pip
export PATH=$PATH:~/.local/bin/pip3
export TERM=xterm-256color

export PATH

# Fortinet
export FORTIPKG=$HOME/fortipkg
export FORTIDEV_PATH=/fortidev
export SILENT=1
export PATH=$PATH:/home/ztang/.local/bin/rb_genco_git

export PATH

# Fortinet
alias conn1='ssh ztang@172.25.58.246'
alias connclient='ssh ian@169.254.242.101'

alias cfos='git clone git@git-van.corp.fortinet.com:fos/fortios.git .'
alias cfpx='git clone git@git-van.corp.fortinet.com:fproxy/fortiproxy.git .'
alias 2fa_verify='ssh git@git-van.corp.fortinet.com 2fa_verify'

alias scp5='scp image.out admin@172.16.80.95:/fgt-image'
alias scp4='scp image.out admin@172.16.80.94:/fgt-image'
alias scp3='scp image.out admin@172.16.80.93:/fgt-image'

alias wad-attach='python3 ~/build/auto/wad_attach.py'
alias wad-attach250='python3 ~/build/auto/wad_attach250.py'

alias tel1='telnet 172.16.80.155'
alias tel2='telnet 172.16.80.156'

# Pipe anything into `clip` to forward it to Clipper
alias clip="nc -N localhost 8377"

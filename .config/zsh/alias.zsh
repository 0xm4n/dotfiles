# Custom ZSH alias

alias sudo='sudo '		# makes aliases work when used with sudo

# application
alias v='nvim'			# nvim
alias t='tmux'			# tmux
alias g='git'			# git
alias p="ps aux | grep "	# ps
alias c='clear'

# history
alias history='history 1'	# show full history instead of last 10

# edit rc
alias vimrc='cd $HOME/.config/nvim && nvim && cd -'
alias zshrc='cd $HOME/.config/zsh && nvim && cd - && source $HOME/.zshrc'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# cd
setopt auto_cd                  # if not a command, try to cd to it.
setopt auto_pushd               # automatically pushd directories on dirstack
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

# git
alias gs='git status'		# git status

# python
alias pip3='python3 -m pip'

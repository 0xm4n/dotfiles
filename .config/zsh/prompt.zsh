# ZSH prompt

# Enable colors
autoload -Uz colors && colors

PROMPT="%{$fg[green]%}%n@%M%{$fg[white]%}:%{$fg[blue]%}%~%{$fg[white]%}%b$%{$reset_color%}"

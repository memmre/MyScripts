export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.local/bin

alias clear='clear && memmre'
alias clrhist='echo > ~/.zsh_history && history -p'
alias ls='gls -lh --group-directories-first --color=auto'

memmre

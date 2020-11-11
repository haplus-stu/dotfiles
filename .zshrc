PROMPT='%F{blue}%U%~%u%f$ '
alias ide="~/workspace/scripts/ide.sh"
alias tkill="tmux kill-server"
alias memo="rusmo"
alias g="git"

#start tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && ide 



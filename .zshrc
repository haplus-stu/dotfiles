# PROMPT='%F{blue}%U%~%u%f$ '
autoload -U promptinit; promptinit
prompt pure
alias tkill="tmux kill-server"
alias memo="rusmo"
alias g="git"
alias ls="exa"
alias ll="exa -alFh --git --time-style=long-iso";
alias lt="exa -T --git-ignore";
alias dc="docker-compose"
alias d="docker"
alias cat="bat"
alias mkdir="mkdir -p"
alias ya="yarn add"
alias yga="yarn global add"
alias alldel="bash ~/dotfiles/docker/all_down.sh"
alias fdown="docker-compose down --rmi all --volumes --remove-orphans"

if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | peco | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

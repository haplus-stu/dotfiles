# fpath+=$HOME/.zsh/pure
# 
# # PROMPT='%F{blue}%U%~%u%f$ '
# autoload -U promptinit; promptinit prompt pure 
alias tkill="tmux kill-server" 
alias memo="rusmo"
alias g="git"
alias ls="exa"
alias ll="exa -alFh --git --time-style=long-iso";
alias lt="exa -T --git-ignore";
alias dc="docker-compose"
alias d="docker"
# alias cat="bat"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias c="powered_cd"
alias ya="yarn add"
alias yga="yarn global add"
alias alldel="bash ~/dotfiles/docker/all_down.sh"
alias fdown="docker-compose down --rmi all --volumes --remove-orphans"
alias vim="nvim"
alias recon="source ~/.${SHELL##*/}rc"
alias shconf="$EDITOR ~/.${SHELL##*/}rc"

alias cl="clear"


#only Linux
alias open="xdg-open"

#about tmux
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

#for fzf https://qiita.com/arks22/items/8515a7f4eab37cfbfb17
function powered_cd_add_log() {
  local i=0
  cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ i = 30 ]; then
      sed -i -e "30,30d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log 
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
}

function powered_cd() {
  if [ $# = 0 ]; then
    cd $(tac ~/.powered_cd.log | fzf)
  elif [ $# = 1 ]; then
    cd $1
  else
    echo "powered_cd: too many arguments"
  fi
}

_powered_cd() {
  _files -/
}

compdef _powered_cd powered_cd

[ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log




export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/hasu/Downloads/alacritty/extra/completions/alacritty.bash
export EDITOR=vim

# export PATH="/home/hasu/.cargo/bin:/home/hasu/.yarn/bin:/home/hasu/.config/yarn/global/node_modules/.bin:/usr/local/bin:/usr/local/sbin:/home/hasu/.cargo/bin:/home/hasu/.yarn/bin:/home/hasu/.config/yarn/global/node_modules/.bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/hasu/.fzf/bin"
export PATH=~/.npm-global/bin:$PATH




# fpath+=$HOME/.zsh/pure
# 
# # PROMPT='%F{blue}%U%~%u%f$ '
# autoload -U promptinit; promptinit prompt pure 
alias tkill="tmux kill-server" 
alias memo="rusmo"
alias g="git"
alias ls="exa -T -L 1 -a"
alias ll="exa -alFh --git --time-style=long-iso";
alias lt="exa -T --git-ignore";
alias dc="docker-compose"
alias d="docker"
alias cat="bat"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias alldel="bash ~/dotfiles/docker/all_down.sh"
alias fdown="docker-compose down --rmi all --volumes --remove-orphans"
alias vim="nvim"
alias recon="source ~/.${SHELL##*/}rc"
alias shconf="$EDITOR ~/.${SHELL##*/}rc"

# if has('linux') 
# 	alias open="xdg-open"
# fi

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




export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(zoxide init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/hasu/Downloads/alacritty/extra/completions/alacritty.bash
export EDITOR=vim

export PATH=~/.npm-global/bin:$PATH


eval "$(starship init zsh)"


export DENO_INSTALL="/Users/shuya/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# $ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
plugins=(zsh-autosuggestions)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


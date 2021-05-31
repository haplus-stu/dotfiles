#!/bin/bash
set -ue

base_path=$(pwd)

#check OS
source ${base_path}/scripts/check_OS.sh

link(){
  local src=$1
  local dest=$2

  ln -nfs "${base_path}/${src}" "${dest}"
}

link "gitconfig" "${HOME}/.gitconfig"

mkdir -p $HOME/.config/nvim/

link "vim/vimrc" "${HOME}/.config/nvim/init.vim"
link "shell/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"

# #vim
# ln -s $HOME/config/vim/vimrc $HOME/.vimrc

#terminal
link "shell/zsh/zshrc" "${HOME}/.zshrc"
link "shell/tmux.conf" "${HOME}/.tmux.conf"

if [[ "${OS}" == "Linux" ]]; then
  echo "Make symlink of i3wm file..."
  #i3
  mkdir -p $HOME/.config/i3blocks
  ln -s $HOME/config/i3/config $HOME/.config/i3/config
  ln -s $HOME/config/i3/i3-blocks-conf $HOME/.config/i3blocks/config
  ln -s $HOME/config/i3/rofi-conf $HOME/.config/rofi/config
fi


if [[ "$1" == "mini" ]]; then
  sh $HOME/config/shell/min-setup.sh
elif [[ "$1" == "full" ]]; then
  sh $HOME/config/shell/setup.sh
else
  : # do nothing
fi


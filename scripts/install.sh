#!/bin/bash
set -ue

base_path=$(pwd)

#check OS
source ${base_path}/scripts/check_OS.sh

link(){
  local src=$1
  local dest=$2

  ln -nfs "${src}" "${dest}"
}

#git
link "${base_path}/gitconfig" "${HOME}/.gitconfig"

mkdir -p $HOME/.config/nvim/
ln -s $HOME/config/vim/vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/config/shell/alacritty.yml $HOME/.config/alacritty/alacritty.yml

#vim
ln -s $HOME/config/vim/vimrc $HOME/.vimrc

#terminal
ln -s $HOME/config/shell/zsh/zshrc $HOME/.zshrc
ln -s $HOME/config/shell/tmux.conf $HOME/.tmux.conf

if [[ "${OS}" == "Linux" ]]; then
  echo "Make symlink of i3wm file..."
  #i3
  mkdir -p $HOME/.config/i3blocks
  ln -s $HOME/config/i3/config $HOME/.config/i3/config
  ln -s $HOME/config/i3/i3-blocks-conf $HOME/.config/i3blocks/config
  ln -s $HOME/config/i3/rofi-conf $HOME/.config/rofi/config
fi


if [[ "$1" == "mini" ]]; then
  bash $HOME/config/shell/min-setup.sh
elif [[ "$1" == "full"]]; then
  bash $HOME/config/shell/setup.sh
fi

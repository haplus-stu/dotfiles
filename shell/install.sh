#!/bin/bash

mkdir -p $HOME/.config/nvim/
ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/shell/alacritty.yml $HOME/.config/alacritty/alacritty.yml

#vim
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/vim/editor.vim $HOME/.editor.vim
ln -s $HOME/dotfiles/vim/keymap.vim $HOME/.keymap.vim

#terminal
ln -s $HOME/dotfiles/shell/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/shell/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/shell/ranger $HOME/.config/ranger

if ["$(expr substr $(uname -s) 1 5)" == 'Linux']; then
  #i3
  mkdir -p $HOME/.config/i3blocks
  ln -s $HOME/dotfiles/i3/config $HOME/.config/i3/config
  ln -s $HOME/dotfiles/i3/i3-blocks-conf $HOME/.config/i3blocks/config
  ln -s $HOME/dotfiles/i3/rofi-conf $HOME/.config/rofi/config
fi


if [[ "$1" == "mini" ]]; then
  bash $HOME/dotfiles/shell/min-setup.sh
elif [[ "$1" == "full"]]; then
  bash $HOME/dotfiles/shell/setup.sh
fi

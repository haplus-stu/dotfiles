#!/bin/bash

mkdir -p $HOME/.config/nvim/
ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml

#vim 
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/vim/plugin.vim $HOME/.plugin.vim
ln -s $HOME/dotfiles/vim/editor.vim $HOME/.editor.vim
ln -s $HOME/dotfiles/vim/plugin.vim $HOME/.plugin.vim

#terminal
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux_conf $HOME/.tmux_conf



#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

check_OS


echomsg "install neovim(head)..."

if [[ ${OS} == "Mac" ]]; then
  brew install neovim --HEAD
elif [[ ${OS} == "Linux" ]];then
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
  chmod +x /tmp/nvim-nightly;
  sudo mv /tmp/nvim-nightly /usr/local/bin/nvim;
fi


echomsg "create symlink..."
mkdir -p $HOME/.config/nvim
ln -nfs "${HOME}/config/vim/vimrc" "${HOME}/.config/nvim/init.vim"

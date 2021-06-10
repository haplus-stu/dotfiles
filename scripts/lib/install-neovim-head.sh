#!/usr/bin/env bash
PATH_DIR_PARENT="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"
echo "$PATH_DIR_PARENT"

source ${PATH_DIR_PARENT}/scripts/utils.sh

echomsg "install neovim(head)..."

curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
chmod +x /tmp/nvim-nightly;
sudo mv /tmp/nvim-nightly /usr/local/bin/nvim;

echomsg "create symlink..."
base_path=$(pwd)
ln -nfs "${HOME}/config/vim/vimrc" "${HOME}/.config/nvim/init.vim"

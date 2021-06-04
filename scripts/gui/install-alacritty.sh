#!/usr/bin/env bash

PATH_DIR_PARENT="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"
echo "$PATH_DIR_PARENT"

source ${PATH_DIR_PARENT}/utils.sh

echomsg "install alacritty ..."

if [[ ! -e $HOME/.cargo ]];then
  echomsg "not install cargo Run cargo install script"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

source $HOME/.cargo/env

cargo install alacritty

echomsg "create symlink ..."
ln -nfs $HOME/config/shell/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml


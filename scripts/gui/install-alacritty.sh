#!/usr/bin/env bash

PATH_DIR_PARENT="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"
echo "$PATH_DIR_PARENT"

source ${PATH_DIR_PARENT}/utils.sh

check_pkgmanager

echomsg "create symlink ..."
mkdir -p $HOME/.config/alacritty/

ln -nfs $HOME/config/shell/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echomsg "install alacritty ..."

if [[ ! -e $HOME/.cargo ]];then
  echomsg "not install cargo Run cargo install script"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

source $HOME/.cargo/env



#########################################################
#
# install dependencies
#
#########################################################



if [[ '${PKGMANAGER}' == 'pacman' ]]; then
  sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb --noconfirm
elif [[ '${PKGMANAGER}' == 'apt' ]]; then
  sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
fi

rustup override set stable
rustup update stable

git clone https://github.com/alacritty/alacritty.git
cd alacritty

cargo build --release

infocmp alacritty


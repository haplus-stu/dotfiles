#!/usr/bin/env bash
source $(dirname "${BASH_SOURCE[0]:-$0}")/utils.sh

check_pkgmanger


echomsg "install i3..."

if [[ "${PKGMANAGER}" == "pacman" ]]; then
  sudo pacman -S i3-gaps --noconfirm

elif [[ "${PKGMANAGER}" == "apt" ]]; then

  wget https://gist.githubusercontent.com/chewwt/cbdb71b92b9a45e3ac9314e64c58cbf4/raw/cd1053cf9771b922348a019735e21670a162043c/i3-gaps.sh

  chmod +x ./i3-gaps.sh

  bash ./i3-gaps.sh

  rm ./i3-gaps.sh

fi

echomsg "Make symlink of i3wm file..."

mkdir -p $HOME/.config/i3blocks
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/rofi


ln -nfs $HOME/config/i3/config         $HOME/.config/i3/config
ln -nfs $HOME/config/i3/i3-blocks-conf $HOME/.config/i3blocks/config
ln -nfs $HOME/config/i3/rofi-conf      $HOME/.config/rofi/config

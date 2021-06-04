#!/usr/bin/env bash

PATH_DIR_PARENT="$(dirname "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)")"
echo "$PATH_DIR_PARENT"

source ${PATH_DIR_PARENT}/scripts/utils.sh

echomsg "install i3..."


wget https://gist.githubusercontent.com/chewwt/cbdb71b92b9a45e3ac9314e64c58cbf4/raw/cd1053cf9771b922348a019735e21670a162043c/i3-gaps.sh

chmod +x ./i3-gaps.sh

bash ./i3-gaps.sh

rm ./i3-gaps.sh

echomsg "Make symlink of i3wm file..."

mkdir -p $HOME/.config/i3blocks
ln -nfs $HOME/config/i3/config         $HOME/.config/i3/config
ln -nfs $HOME/config/i3/i3-blocks-conf $HOME/.config/i3blocks/config
ln -nfs $HOME/config/i3/rofi-conf      $HOME/.config/rofi/config

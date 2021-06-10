#!/usr/bin/env bash

set -eu

function setup_alacritty(){
  check_pkgmanger

  if[[ "${PKGMANAGER}" == pacman ]]; then
        sudo pacman -S --noconfirm --needed alacritty
  fi
}

setup_alacritty

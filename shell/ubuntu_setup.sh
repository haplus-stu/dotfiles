#!/bin/bash

echo $1

if [[ "$1" = "arch" ]]; then
  PACKAGE_CMD="pacman -S "
  echo ${PACKAGE_CMD}
elif [[ "$1" = "ubuntu" ]]; then
  PACKAGE_CMD="apt install"
  echo ${PACKAGE_CMD}
fi

echo "
#===============
check upgrade
#==============="
if [[ "$1" -eq "ubuntu" ]]; then
  sudo apt update -y
elif [[ "$1" -eq "arch" ]]; then
  sudo pacman -Sy
fi

INSTALL_PKG_LIST=("nodejs" "npm" "neofetch");

for pkg in "${INSTALL_PKG_LIST[@]}"
do
  echo "
  #==================
  sudo $PACKAGE_CMD $pkg"
  #=================="
  sudo $PACKAGE_CMD -y $pkg
done

 echo "
================
#yarn install
================
"
curl -o- -L https://yarnpkg.com/install.sh | bash
export PATH="$PATH:`yarn global bin`"
#便利ツールのインストール
sudo ${PACKAGE_CMD} -y neofetch
#herokuのインストール
yarn global add heroku
echo "
================
install vim
================
"

git clone https://github.com/vim/vim.git

cd vim/src
sudo make && sudo make install

if [[ "$1" -eq "ubuntu" ]]; then
 sudo add-apt-repository ppa:alessandro-strada/ppa
 sudo apt-get update
 sudo apt-get install google-drive-ocamlfuse
fi

 #rust
 curl https://sh.rustup.rs -sSf | sh

 source $HOME/.cargo/env

 cargo install exa bat rusmo zoxide starship


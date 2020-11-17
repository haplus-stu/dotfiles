#!/bin/bash
echo"
#===============
check upgrade of ubuntu
use command is 
sudo apt update -y
sudo apt upgrade -y 
#==============="
sudo apt update -y
sudo apt upgrade -y
echo"
# ===============
install node and more...
use command is 
sudo apt install -y nodejs npm
sudo npm i -g n
sudo n stable
sudo apt purge -y nodejs npm
# ==============="
sudo apt install -y nodejs npm
sudo npm i -g n
sudo n stable
sudo apt purge -y nodejs npm
echo "
================
#yarn install
use command is
curl -o- -L https://yarnpkg.com/install.sh | bash 
export PATH="$PATH:`yarn global bin`"
================
"
curl -o- -L https://yarnpkg.com/install.sh | bash 
export PATH="$PATH:`yarn global bin`"
#便利ツールのインストール
sudo apt install -y screenfetch
#herokuのインストール
yarn global add heroku
echo"
================
install vim
use command is
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update -y
sudo apt install -y vim
================
"
echo -new '\n' sudo add-apt-repository ppa:jonathonf/vim
sudo apt update -y
sudo apt install -y vim

 sudo add-apt-repository ppa:alessandro-strada/ppa
 sudo apt-get update
 sudo apt-get install google-drive-ocamlfuse

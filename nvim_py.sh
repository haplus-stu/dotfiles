#!/bin/bash
#install pyenv
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
#install 2 and 3
pyenv install 3.8.1
pyenv install 2.7.15
#make virtualenv
pyenv global 3.8.1
pip install virtualenv
virtualenv -p python3 ~/nvim-python3
pyenv global 2.7.15
virtualenv -p python ~/nvim-python2
pyenv global system
#install requirement
source ~/nvim-python3/bin/activate
pip install -r ~/dotfiles/init/linux/python/nvim-python3-requirements.txt
deactivate
source ~/nvim-python2/bin/activate
pip install -r ~/dotfiles/init/linux/python/nvim-python2-requirements.txt
deactivate

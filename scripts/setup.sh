set -eu
#neovim head
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
chmod +x /tmp/nvim-nightly;
sudo mv /tmp/nvim-nightly /usr/local/bin/nvim;

source /home/hasu/config/scripts/check_pkg_manager.sh

echo ${PKGMANAGER}


if [[ "${PKGMANAGER}" == "pacman"  ]];then
 echo updateing...
 sudo ${PKGMANAGER} -Syu
 echo installing package...
 sudo ${PKGMANAGER} -S golang fzf
else
 echo updateing...
 sudo ${PKGMANAGER} update
 echo installing package...
 sudo ${PKGMANAGER} install -y golang fzf
fi

echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshenv
echo "export GOPATH=~/dev/go" >> ~/.zshenv
echo "export GOBIN=\$GOPATH/bin" >> ~/.zshenv
echo "export PATH=\$PATH:\$GOBIN" >> ~/.zshenv
source  ~/.zshenv

mkdir $HOME/workspace

echo Install ghq
go get github.com/x-motemen/ghq

ghq get junegunn/fzf
cd $HOME/workspace/github.com/junegunn/fzf
go install

#rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

cargo install exa bat rusmo zoxide

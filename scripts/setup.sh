#neovim head
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
chmod +x /tmp/nvim-nightly;
sudo mv /tmp/nvim-nightly /usr/local/bin;


#install go
curl -L https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -o go.tar.gz
sudo tar -C /usr/local -xzf go.tar.gz
rm -rf go.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.zshenv

echo Install ghq
go get github.com/x-motemen/ghq

ghq get junegunn/fzf
cd $HOME/workspace/github.com/junegunn/fzf
go install

#rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

cargo install exa bat rusmo zoxide

echo "install neovim(head)..."

curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /tmp/nvim-nightly;
chmod +x /tmp/nvim-nightly;
sudo mv /tmp/nvim-nightly /usr/local/bin/nvim;

#make symlink
echo $(ln -nfs "${HOME}/config/vim/vimrc" "${HOME}/.config/nvim/init.vim")
base_path=$(pwd)
ln -nfs "${HOME}/config/vim/vimrc" "${HOME}/.config/nvim/init.vim"

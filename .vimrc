  set rtp+=~/.vim/plugged/vim-plug
  call plug#begin('~/.vim/plugged')
  Plug 'Shougo/unite.vim'
  Plug 'ujihisa/unite-colorscheme'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  Plug 'Shougo/neocomplete.vim'
  Plug 'scrooloose/syntastic'
  Plug 'osyo-manga/vim-watchdogs'
  Plug 'cohama/lexima.vim'
 
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'dracula/vim',{'as':'dracula'}
  Plug 'rakr/vim-one' 
  call plug#end()
 
  colorscheme one

  autocmd vimenter * NERDTree

  set number

 

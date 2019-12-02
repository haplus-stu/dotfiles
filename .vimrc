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
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] } 
  
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'dracula/vim',{'as':'dracula'}
  Plug 'rakr/vim-one' 
  call plug#end()
 
  colorscheme one


  set number

 

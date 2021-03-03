"エディタ設定 {{{
set imdisable

"ヘルプの日本語化
set helplang=ja

"折りたたみ
set foldmethod=marker

"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set cursorline

" ハイライトサーチの有効化
set hlsearch

" set showtabline=2
set laststatus=2

set statusline=%F
set statusline+=%m
set statusline+=:%l
set statusline+=%=
set statusline+=\ %Y[%{&fileencoding}]

" set noshowmode

"対応するカッコ表示
" set showmatch

"set number

set belloff=all "ミュート

" important:
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
colorscheme tokyonight

" swapファイルを作成しない
set noswapfile

" クリップボードを共有
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif 

"ファイルタイプごとの設定
au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType MAKE setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType rust nnoremap <buffer><silent> gK :<C-u>CocCommand rust-analyzer.openDocs<CR>

"setting indent
set expandtab
set tabstop=2
set shiftwidth=2



set backspace=indent,eol,start
"}}}

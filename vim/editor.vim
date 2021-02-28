"エディタ設定 {{{
set imdisable

"ヘルプの日本語化
set helplang=ja

"折りたたみ
set foldmethod=marker "折りたたみ設定


"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set cursorline

" ハイライトサーチの有効化
set hlsearch

set showtabline=2
set statusline=0
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

if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif " クリップボードを共有

"ファイルタイプごとの設定
au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType rust nnoremap <buffer><silent> gK :<C-u>CocCommand rust-analyzer.openDocs<CR>

"setting indent
set expandtab
set tabstop=2
set shiftwidth=2


set backspace=indent,eol,start


"}}}

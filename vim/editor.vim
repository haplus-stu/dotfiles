set imdisable

"ヘルプの日本語化
set helplang=ja

"折りたたみ
set foldmethod=syntax
"起動時にフォールドされるのを防止
set foldlevelstart=99

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

"対応するカッコ表示
" set showmatch

"ミュート
if exists('&belloff')
  set belloff=all
endif

" important:
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
colorscheme novum

" swapファイルを作成しない
set noswapfile

" クリップボードを共有
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif
if has("unix")| set clipboard+=unnamedplus | endif

"ファイルタイプごとの設定
au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab | set foldmethod=marker |set foldlevelstart=-1
au FileType MAKE setlocal set noexpandtab :retab!<cr>
au FileType rust nnoremap <buffer><silent> gK :<C-u>CocCommand rust-analyzer.openDocs<CR>

"setting indent
set expandtab
set tabstop=2
set shiftwidth=2

set backspace=indent,eol,start

" 基本はタブで開いて、他のタブにあっても既存を使う
set switchbuf=usetab,newtab

"インクリメンタルサーチ
set incsearch

set showcmd
"Undo
if has('persistent_undo')
    set undodir=$HOME/.vimundo  " アンドゥ用ディレクトリ
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
    set undofile "全てのファイルでundo履歴を残す
endif

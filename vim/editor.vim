set imdisable

"ヘルプの日本語化
set helplang=ja

"折りたたみ
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"起動時にフォールドされるのを防止
set foldlevelstart=99

"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

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

"ミュート
if exists('&belloff')
  set belloff=all
endif

" important:
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
" colorscheme bluewery
colorscheme tokyonight

" swapファイルを作成しない
set noswapfile

" クリップボードを共有
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif
if has("unix")| set clipboard+=unnamedplus | endif

"ファイルタイプごとの設定
au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab | set foldmethod=marker |set foldlevel=0
au FileType MAKE setlocal set noexpandtab :retab!<cr>
au FileType zsh set foldmethod=marker

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

"change cursor for vim like neovim
let &t_ti .= "\e[1 q"
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
let &t_te .= "\e[0 q"



if has('nvim')
  augroup neovim-terminal
    au!
    au TermOpen * startinsert
    au BufNewFile te* ++nested call termopen(&shell)
  augroup END
endif

"customize highlight
" hi Pmenu guibg=#333333


"エディタ設定 {{{
set imdisable

"ヘルプの日本語化
set helplang=ja

"折りたたみ
set foldmethod=marker "折りたたみ設定
set smartindent autoindent " 改行時自動インデント

"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set cursorline 

" ハイライトサーチの有効化
set hls

set showtabline=2
set statusline=0
" set noshowmode 

"対応するカッコ表示
set showmatch

"set number

set modifiable
set write

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
set clipboard+=unnamed

"ファイルタイプごとの設定
au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType markdown nnoremap \<Enter> <Leader>o :normal <Leader>o <CR>
au FileType rust nnoremap <buffer><silent> gK :<C-u>CocCommand rust-analyzer.openDocs<CR>

"setting indent
set expandtab
set tabstop=2
set shiftwidth=2

"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible

"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start


"nvim pythonインストール{{{
  if has('nvim') && !filereadable(expand('~/.vim_no_python'))
  let s:python3 = system('which python3')
  if strlen(s:python3) != 0
    let s:python3_dir = $HOME . '/.vim/python3'
    if ! isdirectory(s:python3_dir)
      call system('python3 -m venv ' . s:python3_dir)
      call system('source ' . s:python3_dir . '/bin/activate && pip install neovim flake8 jedi')
    endif
    let g:python3_host_prog = s:python3_dir . '/bin/python'
    let $PATH = s:python3_dir . '/bin:' . $PATH
  endif
endif

"}}}

" }}}

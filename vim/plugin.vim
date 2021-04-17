"Plugin{{{
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim',{'for':'html'}
"Fern
Plug 'lambdalisue/fern.vim',{'on':'Fern'}
Plug 'lambdalisue/fern-hijack.vim'

Plug 'junegunn/vim-easy-align',{'on':['EasyAlign','LiveEasyAlign']}
Plug 'Shougo/junkfile.vim',{'on':'JunkfileOpen'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Support Commentout
Plug 'tyru/caw.vim'

Plug 'ctrlpvim/ctrlp.vim',{'on':'Ctrlp'}

"More confortable undo
Plug 'simnalamburt/vim-mundo'

"Japanese Help Document
Plug 'vim-jp/vimdoc-ja'

"Quick Search
Plug 'jremmen/vim-ripgrep',{'on':'Rg'}
Plug 'thinca/vim-quickrun',{'on':'QuickRun'}

"Formatter
Plug 'maksimr/vim-jsbeautify',{'for':['css','html']}
Plug 'rust-lang/rust.vim',{'for':'rust'}
Plug 'rhysd/vim-clang-format',{'for':['c','cpp','javascript','typescript']}

"Colorscheme
Plug 'ghifarit53/tokyonight-vim'
Plug 'dylnmc/novum.vim'
Plug 'wadackel/vim-dogrun'


"window resize
Plug 'simeji/winresizer'
Plug 'wesQ3/vim-windowswap'

"Japanese Input
Plug 'tyru/eskk.vim'

"Highlight url
Plug 'itchyny/vim-highlighturl'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' ,'on':'Defx'}
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins','on':['Denite','DeniteProjectDir']}
else
  Plug 'Shougo/defx.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'vim-denops/denops.vim'

call plug#end()
"}}}

"Plugin settings{{{

"eskk.vim{{{
let g:eskk#large_dictionary  = {'path':"~/SKK-JISYO.L",'sorted':1,'encoding':'euc-jp'}
let g:eskk#enable_completion = 1
"}}}

let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"rustfmt
let g:rustfmt_autosave = 1

"ClangFormat
let g:clang_format#code_style = 'Google'
let g:clang_format#detect_style_file = 1


"tokyo-night
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 1

"vim-windowswap
let g:windowswap_map_keys = 0 "prevent default bindings

"quickrun{{{

autocmd FileType quickrun call s:quickrun_settings()

function! s:quickrun_settings() abort
  autocmd BufNewFile,BufRead *.cpp  let g:quickrun_config.cpp  = {'exec' : 'g++'}
  autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
  autocmd BufNewFile,BufRead *.ts  let g:quickrun_config.typescript = {'exec' : 'tsc'}
endfunction
"}}}

"treesitter{{{
lua <<EOF
require'nvim-treesitter.configs'.setup{
ensure_installed = "maintained",
highlight = {
  enable = true,
  },
}
EOF
"}}}
"}}}

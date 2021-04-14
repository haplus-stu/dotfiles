"Plugin{{{
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim',{'for':'html'}
"Fern
Plug 'lambdalisue/fern.vim',{'on':'Fern'}
Plug 'lambdalisue/fern-hijack.vim'

Plug 'junegunn/vim-easy-align',{'on':['EasyAlign','LiveEasyAlign']}
Plug 'Shougo/junkfile.vim',{'on':'JunkfileOpen'}

"Language Server Protocol
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"to visualize whitespace
Plug 'ntpeters/vim-better-whitespace'

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
Plug 'jremmen/vim-ripgrep'
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
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins','on':'Denite'}
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

"Lsp settings {{{
    let g:lsp_signs_error = {'text': 'E'}
    let g:lsp_signs_warning = {'text': 'W'}
    if !has('nvim')
        let g:lsp_diagnostics_float_cursor = 1
    endif
    let g:lsp_log_file = ''

    function! s:on_lsp_buffer_enabled() abort
        setlocal completeopt=menu
        setlocal omnifunc=lsp#complete
    endfunction

    augroup lsp_install
        au!
        au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END
" }}}

"eskk.vim{{{
let g:eskk#large_dictionary  = {'path':"~/SKK-JISYO.L",'sorted':1,'encoding':'euc-jp'}
let g:eskk#enable_completion = 1
"}}}

"vim-better-whitespace{{{
" let g:better_whitespace_operator = '0'
let g:better_whitespace_operator = "<Plug>(better-whitespace)"
"}}}

let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"ctrlp
let g:ctrlp_working_path_mode = 'ra'

"rustfmt
let g:rustfmt_autosave = 1

"ClangFormat
let g:clang_format#code_style = 'Google'
let g:clang_format#detect_style_file = 1

"rainbow
let g:rainbow_active = 1

"tokyo-night
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 1

"vim-windowswap
let g:windowswap_map_keys = 0 "prevent default bindings



"quickrun{{{
autocmd BufNewFile,BufRead *.cpp  let g:quickrun_config.cpp  = {'exec' : 'g++'}
autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
autocmd BufNewFile,BufRead *.ts  let g:quickrun_config.typescript = {'exec' : 'tsc'}
"}}}
"}}}

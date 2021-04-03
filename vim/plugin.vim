"Plugin{{{
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'lambdalisue/fern.vim'
Plug 'junegunn/vim-easy-align'

"Language Server Protocol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"Auto complate
Plug 'mattn/vim-lexiv'
Plug 'machakann/vim-sandwich'

Plug 'ntpeters/vim-better-whitespace'

Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Support Commentout
Plug 'tyru/caw.vim'

Plug 'ctrlpvim/ctrlp.vim'

"More confortable undo
Plug 'simnalamburt/vim-mundo'

"Japanese Help Document
Plug 'vim-jp/vimdoc-ja'

"Quick Search
Plug 'jremmen/vim-ripgrep'
Plug 'thinca/vim-quickrun'

"Formatter
Plug 'maksimr/vim-jsbeautify'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'

"Quick Runner
Plug 'erietz/vim-terminator'

"Formatter
Plug 'maksimr/vim-jsbeautify'
Plug 'rhysd/vim-clang-format'

"Colorscheme
Plug 'ghifarit53/tokyonight-vim'
Plug 'Rigellute/rigel'


"window resize
Plug 'simeji/winresizer'
Plug 'wesQ3/vim-windowswap'

"Japanese Input
Plug 'tyru/eskk.vim'

"Make plugin tools
Plug 'vim-denops/denops.vim'

"Highlight url
Plug 'itchyny/vim-highlighturl'

"Vimrc読書会
Plug 'mattn/vim-reading-vimrc'


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

"Fern{{{
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:fern#default_hidden      = 1

augroup __fern__
au!
autocmd VimEnter * ++nested Fern . -reveal=%
augroup END

let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"}}}

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

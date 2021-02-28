"Plugin{{{
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'

Plug 'cohama/lexima.vim'
Plug 'mattn/vim-lexiv'

"Language Server Protocol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"Snippet
Plug 'Shougo/neosnippet.vim' 
Plug 'Shougo/neosnippet-snippets'

Plug 'tyru/caw.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'skanehira/preview-markdown.vim'

Plug 'MichaelMure/mdr'
Plug 'lambdalisue/fern.vim'
Plug 'junegunn/vim-easy-align'
Plug 'previm/previm'
Plug 'mattn/vim-maketable'

Plug 'machakann/vim-sandwich'
Plug 'simnalamburt/vim-mundo'
Plug 'rhysd/vim-clang-format'


"Japanese Help Document
Plug 'vim-jp/vimdoc-ja'

"高速検索
Plug 'jremmen/vim-ripgrep'

"js-formatter
Plug 'maksimr/vim-jsbeautify'


let g:rainbow_active = 1

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 1

let g:vim_markdown_folding_disabled = 1

let g:previm_enable_realtime = 1

let g:previm_open_cmd = 'open -a Google\ Chrome'

"colorscheme
Plug 'ghifarit53/tokyonight-vim'


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

    let g:lsp_settings = {
                \ 'efm-langserver': {
                \   'disabled': 0,
                \   'allowlist': ['markdown'],
                \  }
                \ }

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

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"}}}

"preview_markdown{{{
  let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
if has('mac')
  let g:previm_open_cmd = 'open'
elseif has('linux')
  let g:previm_open_cmd = 'xdg-open'
endif

"}}}


"ctrlp
let g:ctrlp_working_path_mode = 'ra'
"rustfmt
let g:rustfmt_autosave = 1

"}}}

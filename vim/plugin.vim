call plug#begin('~/.vim/plugged')
Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'osyo-manga/vim-watchdogs'
Plug 'cohama/lexima.vim'
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] 
			\}

Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
 Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'Shougo/neosnippet.vim' 
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neocomplcache.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'prabirshrestha/async.vim'
Plug 'mattn/vim-lexiv'
Plug 'tyru/caw.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'turbio/bracey.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'MichaelMure/mdr'
Plug 'lambdalisue/fern.vim'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'ghifarit53/tokyonight-vim'
Plug 'mattn/vim-maketable'
Plug 'machakann/vim-sandwich'
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'skanehira/gh.vim'
Plug 'lambdalisue/gina.vim'
Plug 'easymotion/vim-easymotion'
Plug 'skamsie/vim-lineletters'
Plug 'tyru/eskk.vim'
Plug 'hashue/adtd.vim'
" Plug 'luochen1990/rainbow'
" Plug 'andymass/vim-matchup'
" Plug 'Yggdroot/indentLine'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim'
Plug 'vimcki/vim-quickfile'
Plug 'tmrekk121/prev-md.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'AndrewRadev/tagalong.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'rust-lang/rust.vim'
endif
"for nvim
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
Plug 'jremmen/vim-ripgrep'


let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 1

let g:vim_markdown_folding_disabled = 1

let g:previm_enable_realtime = 1

let g:previm_open_cmd = 'open -a Google\ Chrome'

"colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'rakr/vim-one'
Plug 'flrnd/plastic.vim'
Plug 'koirand/tokyo-metro.vim'
Plug 'ulwlu/elly.vim'
Plug 'adrian5/oceanic-next-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sainnhe/forest-night'
Plug 'cormacrelf/vim-colors-github'
Plug 'thinca/vim-quickrun'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }



call plug#end()


"プラグイン設定{{{

"" lsp settings {{{
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

"eskk.vim
let g:eskk#large_dictionary        = {'path':"~/SKK-JISYO.L",'sorted':1,'encoding':'euc-jp'}
let g:eskk#enable_completion = 1

"nvim-treesitter{{{
  if has('nvim')
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "vue", "ruby" },  -- list of language that will be disabled
    },
  }
EOF
  endif

" }}}

"easymotion
let g:lineletters_settings = {
      \ 'prefix_chars': [',', 'j', 'f'],
      \ 'highlight_group': 'LineNr',
      \ 'after_jump_do': '^'
      \ }
let g:EasyMotion_smartcase = 1

"token
" let g:adtd_token = '56f285f749d5d2b22491433742c258984d99d05d'
" let g:gh_token = '8a4a4756565995384eee9177efe22f27d214a1e7'

" gh.vim
function! s:gh(...) abort
  execute('new gh://'.a:1.'/'.a:2.'/'.a:3)
endfunction

command! -nargs=* GH call s:gh(<f-args>)

"preview_markdown{{{
  let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
if has('mac')
  let g:previm_open_cmd = 'open'
elseif has('linux')
  let g:previm_open_cmd = 'xdg-open'
endif

"}}}

"setting of Bracey
let g:bracey_brower_command = "open"
let g:bracey_server_port = 8000

" lightline
" let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"\u2b64":""}',
"      \ },
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'gina#component#repo#branch'
"      \ },
"      \ }

"ctrlp
let g:ctrlp_working_path_mode = 'ra'



"prettier
if filereadable(findfile('.prettierrc.js', '.;'))
  echo "Using prettier..."
  autocmd BufWritePre *.js,*.jsx,*mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
endif


"Fern
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

let g:neosnippet#snippets_directory='~/dotfiles/snippets'
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"rustfmt
let g:rustfmt_autosave = 1

"}}}

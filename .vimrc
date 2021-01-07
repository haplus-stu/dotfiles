"----------------------------------------------------------------------------------  
"
"init.vim
"----------------------------------------------------------------------------------
"
if has('mac')
  let $VIMRUNTIME="/usr/share/vim/vim82"
  set runtimepath+=/usr/share/vim/vim82
endif

if has('linux')

let $VIMRUNTIME="/usr/share/nvim/runtime"
set runtimepath+=/usr/share/nvim/runtime
endif


let $NOTE_DIR '~/google_drive/Docs'


"vim 初回起動時vim-plug自動インストール{{{
    " set rtp+=~/.vim/plugged/vim-plug
    " install vim-pulg
    if has('vim_starting') 
            set rtp+=~/.vim/plugged/vim-plug 
            if !isdirectory(expand('~/.vim/plugged/vim-plug'))
            echo 'install vim-plug...'
            call system('mkdir -p ~/.vim/plugged/vim-plug')
            call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
        end
    endif
" }}}

let g:mapleader = "\<Space>"
exec 'source' expand('~/.plugin.vim')

"エディタ設定 {{{
set imdisable

"折りたたみ
set foldmethod=marker "折りたたみ設定
set smartindent autoindent " 改行時自動インデント

"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set cursorline 

" ハイライトサーチの有効化
set hls

set t_Co=256

"show statusbar
set laststatus=2 
"hide --INSERT--
set noshowmode 
"対応するカッコ表示
set showmatch

set number
set modifiable
set write

set belloff=all "ミュート

set tabstop=4
set shiftwidth=4

" important:
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
colorscheme tokyonight

" ヘルプ言語日本語優先表示

set helplang=ja 

" swapファイルを作成しない
set noswapfile  
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif " クリップボードを共有
set clipboard+=unnamed

au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType markdown nnoremap \<Enter> <Leader>o :normal <Leader>o <CR>





"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible

"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
"eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"全角スペースの背景白に
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
let g:mapleader = "\<Space>" " Leaderキーをスペースに設定


function! s:neovimTerminal() abort
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(buf, v:true, {'relative': 'win', 'height': &lines/2 , 'width': winwidth(0), 'col': 1 , 'row': 1})
    terminal
endfunction

" }}}

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

let g:asyncomplete_matchfuzzy = 1

"eskk.vim

" let g:eskk#directory         = "~/.eskk"
let g:eskk#large_dictionary        = {'path':"~/SKK-JISYO.L",'sorted':1,'encoding':'euc-jp'}
let g:eskk#enable_completion = 1
" Use yaskkserv
" let g:eskk#server = {
"      \	'host': 'localhost',
"      \	'port': 1178,
"      \}

"nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "vue", "ruby" },  -- list of language that will be disabled
  },
}
EOF

"easymotion
let g:lineletters_settings = {
      \ 'prefix_chars': [',', 'j', 'f'],
      \ 'highlight_group': 'LineNr',
      \ 'after_jump_do': '^'
      \ }
let g:EasyMotion_smartcase = 1

"token
let g:adtd_token = '56f285f749d5d2b22491433742c258984d99d05d'
let g:gh_token = '8a4a4756565995384eee9177efe22f27d214a1e7'

" gh.vim
function! s:gh(...) abort
  execute('new gh://'.a:1.'/'.a:2.'/'.a:3)
endfunction

command! -nargs=* GH call s:gh(<f-args>)

"preview_markdown
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
if has('mac')
  let g:previm_open_cmd = 'open'
elseif has('linux')
  let g:previm_open_cmd = 'xdg-open'
endif

"setting of Bracey
let g:bracey_brower_command = open
let g:bracey_server_port = 8000

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gina#component#repo#branch'
      \ },
      \ }

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:prettier#autoformat = 0



"prettier
if filereadable(findfile('.prettierrc.js', '.;'))
  echo "Using prettier..."
  autocmd BufWritePre *.js,*.jsx,*mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
endif


"Fern
Disable netrw
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


"deno lsp
"
if executable("typescript-language-server")
  " グローバルインストールされたnpmモジュールの保存場所
  let s:npm_root = trim(system("npm root -g"))

  " vim-lspのinitialization_optionsを使用して、typescript-deno-pluginのインストール場所をtypescript-language-serverへ伝えます
  let s:has_typescript_deno_plugin = isdirectory(s:npm_root . "/typescript-deno-plugin")
  let s:plugins = s:has_typescript_deno_plugin
    \ ? [{ "name": "typescript-deno-plugin", "location": s:npm_root }]
    \ : []
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \   "name": "typescript-language-server",
    \   "cmd": {server_info -> ["typescript-language-server", "--stdio"]},
    \   "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \   "whitelist": ["typescript", "typescript.tsx"],
    \   "initialization_options": { "plugins": s:plugins },
    \ })
  augroup END
endif
"}}}

"KeyMaps{{{
" ハイライトを削除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" 設定ファイルを開く
if has('nvim')
  nnoremap <Leader>. :new ~/.config/nvim/init.vim<CR>
else
  nnoremap <Leader>. :new ~/.vimrc<CR>
endif

"再読込
if has('nvim')
  nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>
else
  nnoremap <Leader>s :source ~/.vimrc<CR>
endif

"保存
nnoremap <Leader>w :w<cr>
"終了
nnoremap qq :qall<CR>
"replace
nnoremap <Leader>rep :%s;\<<C-R><C-W>\>;g<Left><Left>;


imap <C-j> <Plug>(eskk:toggle)

noremap <C-n> :Fern .<CR>

"画面分割
map <sv> :vsplit<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ww <C-w>w
nnoremap SH <C-w>>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>   

"LSP
map vd :w<cr>:LspDefinition<cr>
map K <cmd>LspHover<cr>

"Tab設定
map tts <cmd>set expandtab<cr><cmd>retab 4<cr>


nmap pm :PreviewMarkdown<cr>

nmap <silent>, <Plug>LineLetters

nnoremap ut :MundoToggle<cr>

nnoremap ts :Tsad<cr>
nnoremap ta :Tsl<cr>

"エスケープ
inoremap <silent> jj <ESC>

"折りたたみ関連
noremap fo :foldclose<cr>
map dep zo
map fj zj
map fk zk

vmap <C-q> <Plug>(caw:hatpos:toggle)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

caw:hatpos:toggle nmap <C-q> <Plug>(caw:hatpos:toggle) 
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"Go to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

"show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


  command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })


function! s:www(word) abort
  execute('term ++close ++shell w3m google.com/search\?q="' . a:word . '"')
endfunction

command! -nargs=1 WWW call s:www(<f-args>)

function! s:insert_double_space() abort
  let position = getpos('.')  
  execute ":normal A\<Space>\<Space>"
  execute ":normal o"
endfunction

command! InsertEmptyLine call s:insert_double_space()

"ノート検索
command! -nargs=1 Ngrep vimgrep "<args>" ~/google_drive/Docs/*.md | cw
nnoremap <Leader>[ :Ngrep

augroup md
  autocmd!
  au BufWrite *.md PrevimOpen
  au BufNewFile,BufRead *.md nnoremap <Leader> b :normal A <br><cr>
augroup END
"}}}

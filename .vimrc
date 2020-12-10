"vim 初回起動時vim-plug自動インストール{{{
    set rtp+=~/.vim/plugged/vim-plug
    install vim-pulg
    if has('vim_starting') set rtp+=~/.vim/plugged/vim-plug if !isdirectory(expand('~/.vim/plugged/vim-plug'))
            echo 'install vim-plug...'
            call system('mkdir -p ~/.vim/plugged/vim-plug')
            call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
        end
    endif
" }}}


let g:mapleader = "\<Space>"
exec 'source' expand('~/.plugin.vim')

"エディタ設定 {{{

set foldmethod=marker "折りたたみ設定
set smartindent autoindent " 改行時自動インデント
"タブ スペースの可視化
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set cursorline 
set hls
set t_Co=256
set laststatus=2 "show statusbar
set noshowmode "hide --INSERT--
set number
set modifiable
set write
set belloff=all "ミュート
set tabstop=4
set shiftwidth=4
" important:
set termguicolors
set background=dark
syntax on
colorscheme tokyonight
set helplang=ja " ヘルプ言語日本語優先表示
set noswapfile  " swapファイルを作成しない
if has("mac") | set clipboard+=unnamed | else | set clipboard^=unnamedplus | endif " クリップボードを共有

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

autocmd FileType vim set foldmethod=marker

" }}}

"プラグイン設定{{{
"" lsp settings {{{
    let g:lsp_signs_error = {'text': 'ｳﾎ'}
    let g:lsp_signs_warning = {'text': '🍌'}
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
    let g:adtd_token = '56f285f749d5d2b22491433742c258984d99d05d'
    "setting of preview_markdown
    let g:preview_markdown_vertical = 1
    let g:preview_markdown_auto_update = 1
    let g:previm_open_cmd = 'open -a Google\ Chrome'
     "setting of Bracey
     let g:bracey_brower_command = open
     let g:bracey_server_port = 8000
    let g:lightline = {
     \ 'colorscheme': 'wombat',
     \ 'component': {
     \   'readonly': '%{&readonly?"\u2b64":""}',
     \ },
     \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
     \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
     \ }
    let g:ctrlp_working_path_mode = 'ra'
    let g:prettier#autoformat = 0
    if filereadable(findfile('.prettierrc.js', '.;'))
        echo "Using prettier..."
        autocmd BufWritePre *.js,*.jsx,*mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
    endif

     Disable netrw
     let g:loaded_netrw             = 1
     let g:loaded_netrwPlugin       = 1
     let g:loaded_netrwSettings     = 1
     let g:loaded_netrwFileHandlers = 1

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

"}}}

"KeyMaps{{{
" ハイライトを削除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" vimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
map <C-n> <cmd>Fern .<CR>
map <sv> :vsplit<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ww <C-w>w
nnoremap SH <C-w>>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>   
inoremap <silent> jj <ESC>
nnoremap ut :MundoToggle<cr>
nmap pm :PreviewMarkdown<cr>
nnoremap qq :qall<CR>
map vd <cmd>w<cr><cmd>LspDefinition<cr>
map K <cmd>LspHover<cr>
map tts <cmd>set expandtab<cr><cmd>retab 4<cr>
nnoremap ts :Tsad<cr>
nnoremap ta :Tsl<cr>

"折りたたみ関連
map fo <cmd>foldclose<cr>
map dep zo
map fj zj
map fk zk
vmap <C-q> <Plug>(caw:hatpos:toggle)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"replace
nnoremap <Leader>rep :%s;\<<C-R><C-W>\>;g<Left><Left>;

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

caw:hatpos:toggle nmap <C-q> <Plug>(caw:hatpos:toggle) 


command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

"}}}


hoge

fuga

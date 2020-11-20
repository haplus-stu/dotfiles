    set rtp+=~/.vim/plugged/vim-plug
    install vim-pulg
    if has('vim_starting')
        set rtp+=~/.vim/plugged/vim-plug
        if !isdirectory(expand('~/.vim/plugged/vim-plug'))
            echo 'install vim-plug...'
            call system('mkdir -p ~/.vim/plugged/vim-plug')
            call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
        end
    endif

    set list
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
    set cursorline 
    set clipboard+=unnamed
    set hls

     
 
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
    "Plug 'neoclide/coc.nvim',{'branch':'release'}
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'lighttiger2505/deoplete-vim-lsp'
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/neosnippet.vim' 
    Plug 'Shougo/neosnippet-snippets'
	Pulg 'Shougo/neocomplcache.vim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'prabirshrestha/async.vim'
    Plug 'mbbill/undotree'
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
    Plug 'kato-k/vim-colorscheme-settings'

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
    Plug 'adrian5/oceanic-next-vim'
    call plug#end()
 

     colorscheme tokyonight


    let mapleader = "\<Space>"
    nnoremap <Leader>w :w<cr>

    "setting of preview_markdown
    let g:preview_markdown_vertical = 1
    let g:preview_markdown_auto_update = 1

    "setting of caw.vim 
     caw:hatpos:toggle nmap <C-q> <Plug>(caw:hatpos:toggle) 
     vmap <C-q> <Plug>(caw:hatpos:toggle)

     " Start interactive EasyAlign in visual mode (e.g. vipga)
     xmap ga <Plug>(EasyAlign)

     " Start interactive EasyAlign for a motion/text object (e.g. gaip)
     nmap ga <Plug>(EasyAlign)

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
 
    set t_Co=256
    "#show statusbar
    set laststatus=2
    "# hide --INSERT--
    set noshowmode
 
    set number

    set modifiable
    set write

    "ビープ音すべてを無効にする
    set visualbell t_vb=
    set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

    set tabstop=4
    set shiftwidth=4
 
 
    map <C-n> <cmd>Fern .<CR>
    map <sv> :vsplit<CR>
    nnoremap sj <C-w>j
    nnoremap sk <C-w>k
    nnoremap sl <C-w>l
    nnoremap sh <C-w>h
    nnoremap ww <C-w>w
    nnoremap ss :<C-u>sp<CR>
    nnoremap sv :<C-u>vs<CR>
    inoremap <silent> jj <ESC>
    nnoremap ut :UndotreeToggle<cr>
    nmap pm :PreviewMarkdown<cr>
    nnoremap qq :qall<CR>
    map vd <cmd>w<cr><cmd>LspDefinition<cr>
    map K <cmd>LspHover<cr>
    map tts <cmd>set expandtab<cr><cmd>retab 4<cr>
    map fo zfap
    map dep zo



    " important:
    set termguicolors

    set background=dark
    syntax on


    command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

    "全角スペースの背景白に
    autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
    autocmd VimEnter * match FullWidthSpace /　/

    "Fernをデフォルトディレクトリブラウザに指定
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

    "viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
    set nocompatible
    "カーソルを行頭，行末で止まらないようにする
    set whichwrap=b,s,h,l,<,>,[,]
    "BSで削除できるものを指定する
    " indent  : 行頭の空白
    "eol     : 改行
    " start   : 挿入モード開始位置より手前の文字
    set backspace=indent,eol,start
    
    let g:neosnippet#snippets_directory='~/dotfile/snipetts'

	" Plugin key-mappings.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	 xmap <C-k>     <Plug>(neosnippet_expand_target)
	"
	" " SuperTab like snippets behavior.
	" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	"imap <expr><TAB>
	" " \ pumvisible() ? "\<C-n>" :
	" " \ neosnippet#expandable_or_jumpable() ?
	" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	"
	" For conceal markers.
	 if has('conceal')
		   set conceallevel=2 concealcursor=niv
	   endif



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
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 
    Plug 'rakr/vim-one'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim',{'branch':'release'}
    Plug 'Shougo/neosnippet.vim' 
	Plug 'prabirshrestha/async.vim'
	Plug 'mbbill/undotree'
	Plug 'mattn/vim-lexiv'
	Plug 'w0ng/vim-hybrid'
	Plug 'tyru/caw.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'turbio/bracey.vim'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'sainnhe/edge'
	Plug 'flrnd/plastic.vim'
	Plug 'skanehira/preview-markdown.vim'
	Plug 'MichaelMure/mdr'
	Plug 'lambdalisue/fern.vim'
	Plug 'https://github.com/MichaelMure/mdr'
	
    call plug#end()

	let mapleader = "\<Space>"
	nnoremap <Leader>w :w<cr>

	"setting of preview_markdown
	let g:preview_markdown_vertical = 1
	let g:preview_markdown_auto_update = 1

	"setting of caw.vim 
	caw:hatpos:toggle
	 nmap <C-q> <Plug>(caw:hatpos:toggle)
	 vmap <C-q> <Plug>(caw:hatpos:toggle)

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


	" SuperTab like snippets behavior.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

	" For conceal markers.
	if has('conceal')
	  set conceallevel=2 concealcursor=niv
	endif

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
 
 
    map <C-n> :Fern .<CR>
    map <sv> :vsplit<CR>
    nnoremap sj <C-w>j
    nnoremap sk <C-w>k
    nnoremap sl <C-w>l
    nnoremap sh <C-w>h
    nnoremap ss :<C-u>sp<CR>
    nnoremap sv :<C-u>vs<CR>
    inoremap <silent> jj <ESC>
    nnoremap ut :UndotreeToggle<cr>
	nmap pm :PreviewMarkdown<cr><C-w>x



    " important:
	set termguicolors

	set background=dark
	syntax on
	colorscheme hybrid 


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
	" eol     : 改行
	" start   : 挿入モード開始位置より手前の文字
	set backspace=indent,eol,start
	
	"ペースト時のインデント補正
	if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
	endif
	set directory = ~/vim_backup_item


	nnoremap <Leader>m :<C-u>call EditDailyMemo()<CR>
	function! EditDailyMemo()
		let l:daily_memo_dir = '/tmp'
		if isdirectory($DAILY_MEMO_DIR)
			let l:daily_memo_dir = $DAILY_MEMO_DIR
		endif
		let l:memo_dir = l:daily_memo_dir.'/'.strftime('%Y/%m')
		let l:memo_file = l:memo_dir.'/'.strftime('%d').'.txt'
		call mkdir(l:memo_dir, 'p')
		execute "tabnew ".l:memo_file
	endfunction

	"setting of Todo
	abbreviate tl - []
	abbreviate done x

	nnoremap qq :qall<CR>

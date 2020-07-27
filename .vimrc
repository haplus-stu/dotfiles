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
	 
 
    call plug#begin('~/.vim/plugged')
    Plug 'Shougo/unite.vim'
    Plug 'ujihisa/unite-colorscheme'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/emmet-vim'
    Plug 'Shougo/neocomplete.vim'
	Plug 'Shougo/neocomplcache'
	Plug 'Shougo/neosnippet-snippets'
    Plug 'scrooloose/syntastic'
    Plug 'osyo-manga/vim-watchdogs'
    Plug 'cohama/lexima.vim'
    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 
    Plug 'rakr/vim-one'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim',{
                  \ 'colorscheme': 'wombat'
  		  \ }
    Plug 'neoclide/coc.nvim',{'branch':'release'}
    Plug 'Shougo/neosnippet.vim' 
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'mattn/vim-goimports'
	Plug 'seesleestak/duo-mini' 
	Plug 'mbbill/undotree'
	Plug 'mattn/vim-lexiv'


    call plug#end()

	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
	let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/dotfiles/snippets/'
 
 
	let g:prettier#autoformat = 0
	if filereadable(findfile('.prettierrc.js', '.;'))
		echo "Using prettier..."
		autocmd BufWritePre *.js,*.jsx,*mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
	endif
 
    colorscheme dracula 
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
 
    "tnoremap <Esc> <C-w><S-n>
 
    map <C-n> :NERDTreeToggle<CR>
    map <sv> :vsplit<CR>
    nnoremap sj <C-w>j
    nnoremap sk <C-w>k
    nnoremap sl <C-w>l
    nnoremap sh <C-w>h
    nnoremap ss :<C-u>sp<CR>
    nnoremap sv :<C-u>vs<CR>
    inoremap <silent> jj <ESC>
    nnoremap ut :UndotreeToggle

    " important:
	set termguicolors

	set background=dark
	syntax on
	colorscheme duo-mini 

	"" if you use lightline
	" Lightline
	let g:lightline = { 'colorscheme': 'candid' }

	command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

	"全角スペースの背景白に
	autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
	autocmd VimEnter * match FullWidthSpace /　/

	nmap <silent> gd :LspDefinition<CR>
	nmap <silent> <f2> :LspRename<CR>
	nmap <silent> <Leader>d :LspTypeDefinition<CR>
	nmap <silent> <Leader>r :LspReferences<CR>
	nmap <silent> <Leader>i :LspImplementation<CR>
	let g:lsp_diagnostics_enabled = 1
	let g:lsp_diagnostics_echo_cursor = 1
	let g:asyncomplete_popup_delay = 200
	let g:lsp_text_edit_enabled = 0


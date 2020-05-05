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
    Plug 'scrooloose/syntastic'
    Plug 'osyo-manga/vim-watchdogs'
    Plug 'cohama/lexima.vim'
    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 
    Plug 'gosukiwi/vim-atom-dark'
    Plug 'dracula/vim',{'as':'dracula'}
    Plug 'rakr/vim-one'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim',{
                  \ 'colorscheme': 'wombat'
  		  \ }
    Plug 'neoclide/coc.nvim',{'branch':'release'}
    Plug 'wadackel/vim-dogrun'
    Plug 'altercation/vim-colors-solarized'
    Plug 'Shougo/neosnippet.vim' 
    Plug 'flrnd/candid.vim'

    call plug#end()
 
 
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


	autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
	autocmd VimEnter * match FullWidthSpace /　/

    " important:
	set termguicolors

	set background=dark
	syntax on
	colorscheme candid

	"" if you use lightline
	" Lightline
	let g:lightline = { 'colorscheme': 'candid' }

	command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

	"全角スペースの背景白に
	autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
	autocmd VimEnter * match FullWidthSpace /　/

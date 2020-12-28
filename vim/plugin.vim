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
Plug 'machakann/vim-sandwich'
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'skanehira/gh.vim'
Plug 'lambdalisue/gina.vim'
Plug 'easymotion/vim-easymotion'
Plug 'skamsie/vim-lineletters'
Plug 'segeljakt/vim-silicon'
Plug 'tyru/eskk.vim'
Plug 'lambdalisue/pinkyless.vim'
Plug 'rust-lang/rust.vim'
Plug 'higashi000/sarahck.vim'








"for nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


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



call plug#end()



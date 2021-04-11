"Setting space as <Leader>
let g:mapleader = "\<Space>"
let maplocalleader = ';'

"toggle line number
nnoremap <silent> <Leader>l :set number!<cr>

" Delete highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<cr>

" Open setting file
nnoremap <silent> <Leader>. :tabe $MYVIMRC<cr>

"Reload
nnoremap <silent> <Leader>s :source $MYVIMRC<cr>

"Save
nnoremap <Leader>w :w<cr>
"Exit
nnoremap qq :confirm qall<cr>
"All delete
noremap DD :%d<cr>

"All yank
noremap YY :%y<cr>

"For US keyboard
noremap ; :
noremap : ;

"Open file browse
noremap <silent> <C-n> :Fern . -drawer -toggle<cr>

"command mode{{{
  " コマンドラインで単語移動
  " based skanehira/dotfiles
  cnoremap <c-b> <S-Left>
  cnoremap <c-f> <S-Right>
  cnoremap <c-a> <Home>
"}}}

"Split display{{{
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h
nnoremap <silent> ss :<C-u>sp<cr>
nnoremap <silent> sv :<C-u>vs<cr>
"}}}

nnoremap U :MundoToggle<cr>

vnoremap <silent> <Enter> :LiveEasyAlign<cr>

"grep
nnoremap <Leader>r :Rg<Space>

"Escape
inoremap <silent> jj <ESC>

"based on antonk52
" go to the beginning of the line (^ is too far)
nnoremap <Leader>a ^
vnoremap <Leader>a ^
" go to the end of the line ($ is too far)
nnoremap <Leader>e $
vnoremap <Leader>e $


"折りたたみ関連{{{
noremap <silent>fo :foldclose<cr>
map <silent>dep zo
map fj zj
map fk zk
"}}}


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gA <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gA <Plug>(EasyAlign)

"snippet{{{
	imap <C-k>  <Plug>(deoppet_expand)
	imap <C-f>  <Plug>(deoppet_jump_forward)
	imap <C-b>  <Plug>(deoppet_jump_backward)
	smap <C-f>  <Plug>(deoppet_jump_forward)
	smap <C-b>  <Plug>(deoppet_jump_backward)
"}}}

"caw:hatpos:toggle
nmap <C-\> <Plug>(caw:hatpos:toggle)
vmap <C-\> <Plug>(caw:hatpos:toggle)

"quickrun
noremap <Leader>q :QuickRun<cr>

"vim-windowswap{{{
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<cr>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<cr>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<cr>
"}}}

"Coc.nvim{{{
  nmap <silent> gh :<c-u>call CocAction('doHover')<cr>
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-reference)
"}}}

au FileType javascript noremap<buffer> <c-f> :ClangFormat<cr>
au FileType typescript noremap<buffer> <c-f> :ClangFormat<cr>

au FileType c noremap<buffer> <c-f> :ClangFormat<cr>
au FileType cpp noremap<buffer> <c-f> :ClangFormat<cr>

au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>

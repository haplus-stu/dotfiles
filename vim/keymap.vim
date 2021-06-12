"Mapping Table{{{
"-------------------------------------------------------------------------------------------------|
" Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator | Terminal | Lang-Arg |
" map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |    -     |    -     |
" nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |    -     |    -     |
" map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    -     |
" imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |    -     |    -     |
" cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |    -     |    -     |
" vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |    -     |    -     |
" xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |    -     |    -     |
" smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |    -     |    -     |
" omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |    -     |    -     |
" tmap / tnoremap  |    -   |   -    |    -    |   -    |   -    |    -     |    @     |    -     |
" lmap / lnoremap  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |    @     |
"}}}

"Setting space as <Leader>
let g:mapleader = "\<Space>"

"Only Neovim{{{
if has('nvim')
  nnoremap <silent> <Leader>tt :tab terminal<cr>
  tnoremap <silent> <C-[> <C-\><C-n>
endif
"}}}


"toggle line number
nnoremap <silent> <Leader>l :set number!<cr>

"show register list
nnoremap ;r :reg<CR>

" Delete highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<cr>

" Open setting file
nnoremap <silent> <Leader>. :tabe $MYVIMRC<cr>

"Reload
nnoremap <silent> <Leader>s :source $MYVIMRC<cr>

"Save
nnoremap <Leader>w :w<cr>

"Exit
nnoremap Q :confirm qall<cr>

"All delete
noremap DD :%d<cr>

"All yank
noremap YY :%y<cr>

"switch between two files
nnoremap <M-[> :<C-u>e #<cr>

"close tab
nnoremap <M-q> :tabclose<cr>

"For US keyboard{{{
 noremap ; :
 noremap : ;
"}}}

"more comfortable settings to use motion{{{
noremap m) ])
noremap m} ]}
" }}}

" create a new empty tab w/ buffer with current register {{{
 nnoremap <silent> <Space>ap  <Cmd>tabnew<Cr>]p:call deletebufline('%', 1, 1)<Cr>
 vnoremap <silent> <Space>ap y<Cmd>tabnew<Cr>]p:call deletebufline('%', 1, 1)<Cr>
" }}}

"Split display{{{
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h
nnoremap <silent> ss :<C-u>sp<cr>
nnoremap <silent> sv :<C-u>vs<cr>
"}}}


"grep
nnoremap <Leader>r :Rg<Space>
nnoremap <Leader>R :Rg<Space><C-w><C-r><cr>


"Escape
inoremap <silent> jj <ESC>

"more comfortable settings to cursor move{{{
"based on antonk52
" go to the beginning of the line (^ is too far)
nnoremap <Leader>a ^
vnoremap <Leader>a ^
" go to the end of the line ($ is too far) nnoremap <Leader>e $
vnoremap <Leader>e $

"based on ycino
noremap <expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'
"}}}

"fold-related{{{
noremap <silent>fo :foldclose<cr>
map <silent>dep zo
map fj zj
map fk zk
"}}}

"CommandLine{{{
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-h> <Del>
"}}}

"settings of Plugins{{{
"
"Fern.vim{{{
noremap <silent> <C-n> :Fern . -drawer -toggle<cr>
"}}}

"caw.vim{{{
nmap <C-\> <Plug>(caw:hatpos:toggle)
vmap <C-\> <Plug>(caw:hatpos:toggle)
"}}}

"quickrun{{{
noremap <Leader>q :QuickRun<cr>
"}}}

"zoxide.vim{{{
nnoremap <Leader>j :Z<space>
"}}}

"vim-lsp{{{
  nnoremap <silent> gh :LspHover<cr>
  nnoremap <silent> gd :LspDefinition<cr>
  nnoremap <silent> gr :LspRename<cr>
"}}}

"filetype settings{{{
au FileType javascript noremap<buffer> <c-f> :ClangFormat<cr>
au FileType typescript noremap<buffer> <c-f> :ClangFormat<cr>

au FileType c noremap<buffer> <c-f> :ClangFormat<cr>
au FileType cpp noremap<buffer> <c-f> :ClangFormat<cr>

au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
"}}}

"deol.nvim{{{
nnoremap <Space>as  :<C-u>tabnew<Cr>:pwd<Cr>:Deol -edit -start-insert -auto-cd -toggle<Cr>
"}}}


"denite.nvim{{{
nnoremap <silent> ;f :<c-u>Denite -start-filter file/rec<cr>
nnoremap <silent> ;F :<c-u>DeniteProjectDir -start-filter file/rec<cr>
nnoremap <silent> ;g :<C-u>Denite grep<CR>
nnoremap <silent> ;G :<C-u>DeniteProjectDir grep<CR>
"}}}

"vim-vsnip{{{
imap <Tab> <Plug>(vsnip-expand-or-jump)
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <C-j> vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"
"}}}

"EasyAlign{{{
vnoremap <silent> <Enter> :LiveEasyAlign<cr>
"}}}
"todo-comments.nvim{{{
nnoremap <Leader>lt :TodoQuickFix cwd= execute 'pwd'<cr>

"}}}

nnoremap U :MundoToggle<cr>
"}}}

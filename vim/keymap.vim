"Setting space as <Leader>
let g:mapleader = "\<Space>"

" Delete highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<cr>

" Open setting file
nnoremap <Leader>. :tabe $MYVIMRC<cr>

"Reload
nnoremap <Leader>s :source $MYVIMRC<cr>

"Save nnoremap <Leader>w :w<cr> "Exit
nnoremap qq :qall<cr>

"All delete
noremap DD :%d<cr>
"All yank
noremap YY :%y<cr>

"Open file browse
noremap <silent> <C-n> :Fern . -drawer -toggle<cr>

"Split display{{{
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sh <C-w>h
nnoremap <silent> ss :<C-u>sp<cr>
nnoremap <silent> sv :<C-u>vs<cr>
"}}}

"Setting about Tab
map tts :setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab<cr>

nmap pm :PreviewMarkdown<cr>

nnoremap U :MundoToggle<cr>

"grep
nnoremap <Leader>r :Rg<Space>

"Escape
inoremap <silent> jj <ESC>

"折りたたみ関連{{{
noremap <silent>fo :foldclose<cr>
map <silent>dep zo
map fj zj
map fk zk
"}}}

vmap <C-q> <Plug>(caw:hatpos:toggle)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gA <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gA <Plug>(EasyAlign)

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"caw:hatpos:toggle 
nmap <C-q> <Plug>(caw:hatpos:toggle)

"vim-lsp{{{
  nmap <silent> vh :LspHover<cr>
  nmap <silent> vd :LspPeekDefinition<cr>
  nmap <silent> vr :LspReferences<cr>
  nmap <silent> vR :LspRename<cr>
"}}}

au FileType javascript noremap<buffer> <c-f> :ClangFormat<cr>
au FileType typescript noremap<buffer> <c-f> :ClangFormat<cr>
au FileType c noremap<buffer> <c-f> :ClangFormat<cr>

au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>


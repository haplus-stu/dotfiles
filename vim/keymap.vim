"Setting space as <Leader>
let g:mapleader = "\<Space>"
" Delete highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Open setting file
if has('nvim')
  nnoremap <Leader>. :tabe ~/.config/nvim/init.vim<CR>
else
  nnoremap <Leader>. :tabe ~/.vimrc<CR>
endif

"Reload
if has('nvim')
  nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>
else
  nnoremap <Leader>s :source ~/.vimrc<CR>
endif

"Save
nnoremap <Leader>w :w<cr>
"Exit
nnoremap qq :qall<CR>
"replace
nnoremap <Leader>rep :%s;\<<C-R><C-W>\>;g<Left><Left>;
"All delete
noremap DD :%d<cr>
"All yank
noremap YY :%y<cr>

"Open file browse
noremap <C-n> :Fern .<CR>

"Split display{{{
map <sv> :vsplit<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ww <C-w>w
nnoremap SH <C-w>>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>   
"}}}


"Setting about Tab
map tts <cmd>set expandtab<cr><cmd>retab 4<cr>

nmap pm :PreviewMarkdown<cr>


nnoremap ut :MundoToggle<cr>

" nnoremap ts :Tsad<cr>
" nnoremap ta :Tsl<cr>

"grep
nnoremap <Leader>r :Rg 

"エスケープ
inoremap <silent> jj <ESC>

"折りたたみ関連{{{
noremap fo :foldclose<cr>
map dep zo
map fj zj
map fk zk
"}}}

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

"caw:hatpos:toggle 
nmap <C-q> <Plug>(caw:hatpos:toggle) 

"Go to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)

"vim-lsp{{{
  nmap <silent> vh :LspHover<cr>
  nmap <silent> vd :LspPeekDefinition<cr>
  nmap <silent> vr :LspReferences<cr>
  nmap <silent> vR :LspRename<cr>
"}}}

"Terminal
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

"gh.vim{{{
  function! s:www(word) abort
    execute('term ++close ++shell w3m google.com/search\?q="' . a:word . '"')
  endfunction

  command! -nargs=1 WWW call s:www(<f-args>)
"}}}





  call gina#custom#mapping#nmap(
        \ 'status','b<CR>',
        \ '<Plug>(gina-browse)'
        \)
	call gina#custom#mapping#nmap(
	      \ '/.*', 'g<CR>',
	      \ '<Plug>(gina-edit-tab)'
	      \)
	call gina#custom#command#option(
        \'log',
        \'--opener',
        \'80vsplit'
        \)
  call gina#custom#command#option(
        \'status',
        \'--opener',
        \'80vsplit'
        \)

nnoremap <M-g>l :Gina log<cr>
nnoremap <M-g>s :Gina status<cr>
nnoremap <M-g>ss :Gina status -s<cr>

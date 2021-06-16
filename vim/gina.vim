  call gina#custom#mapping#nmap(
        \ 'status','b<CR>',
        \ '<Plug>(gina-browse)'
        \
        \)
  call gina#custom#mapping#nmap(
        \ 'status','<space>',
        \ '<Plug>(gina-index-toggle)'
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


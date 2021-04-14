" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort

  call denite#custom#var('file/rec', 'command',
  \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

  " Ripgrep command on grep source
  call denite#custom#var('grep', {
             \ 'command': ['rg'],
             \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
             \ 'recursive_opts': [],
             \ 'pattern_opt': ['--regexp'],
             \ 'separator': ['--'],
             \ 'final_opts': [],
             \ })

  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action','tabopen')
  nnoremap <silent><buffer><expr> l
  \ denite#do_map('do_action','open')
   nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('do_action','vsplit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <C-c>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('restore_sources')
endfunction


nnoremap <silent> ;f :<c-u>Denite -start-filter file/rec<cr>
nnoremap <silent> ;F :<c-u>DeniteProjectDir -start-filter file/rec<cr>
nnoremap <silent> ;;g :<C-u>Denite grep<CR>
nnoremap <silent> ;;G :<C-u>DeniteProjectDir grep<CR>

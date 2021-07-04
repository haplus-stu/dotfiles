" 今開いているファイルを削除
command! -bang -nargs=0 DeleteMe call DeleteMe(<bang>0)
function! DeleteMe(force)
  if a:force || !&modified
    let filename = expand('%')
    bdelete!
    call delete(filename)
  else
    echomsg 'File modified'
  endif
endfunction

" 今開いているファイルをリネーム
command! -nargs=1 RenameMe call RenameMe(<q-args>)
function! RenameMe(newFileName)
  let currentFileName = expand('%')
  execute 'saveas ' . a:newFileName
  bdelete! #
  call delete(currentFileName)
endfunction
cnoreabbrev <expr> RenameMe "RenameMe " . expand('%')

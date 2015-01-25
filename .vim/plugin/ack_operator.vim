nnoremap <leader>a :set operatorfunc=<SID>AckOperator<cr>g@
vnoremap <leader>a :<c-u>call <SID>AckOperator(visualmode())<cr>

function! s:AckOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  "echom shellescape(@@)
  silent execute "Ack! -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction

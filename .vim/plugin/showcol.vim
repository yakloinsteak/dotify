let s:columns = '80,100'
let s:toggle_state = "off"
hi ColorColumn ctermbg=234

function! s:col_toggle()
  if s:toggle_state == "off"
    exec 'set cc=' . s:columns
    let s:toggle_state = "on"
  else
    set cc=
    let s:toggle_state = "off"
  endif
endfunction

command! -nargs=0 CT call s:col_toggle()

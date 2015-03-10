au BufRead,BufNewFile *.ino,*.pde set filetype=arduino

function CheckArduino()
  if getline(1) =~# 'Arduino.h'
    set filetype=arduino
  endif
endfunction

au BufRead,BufNewFile *.cpp call CheckArduino()

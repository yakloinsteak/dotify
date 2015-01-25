if !has('signs')
  finish
endif

command! -buffer Flog call todd_flog#Update()
command! -buffer FlogOff call todd_flog#Off()

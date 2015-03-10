" Generic, global autocommands

if has("autocmd")
  augroup todd_global
    autocmd!

    " Always remember to turn this off after pasting.
    au insertLeave * set nopaste

    " Never want tabs. I hate 'em
    au BufNewFile,BufReadPost * setlocal expandtab

    " Rails stuff
    autocmd User Rails silent! Rlcd

    " Git auto-add
    au BufWritePost * :call system("git add " . expand("%") .  " > /dev/null")
  augroup END
endif

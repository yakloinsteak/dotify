function! Paste(regname, pasteType, pastecmd)
  let reg_type = getregtype(a:regname)
  "call setreg(a:regname, getreg(a:regname), a:pasteType)
  "call setreg(a:regname, getreg(a:regname), a:pasteType)
  "exe 'normal "'.a:regname . a:pastecmd
  if a:pasteType == "v"
    call setreg(a:regname, substitute(getreg(a:regname), "^  *", " ", ""), a:pasteType)
    exe 'normal "'.a:regname . a:pastecmd
    join
  else
    call setreg(a:regname, getreg(a:regname), a:pasteType)
    exe 'normal "'.a:regname . a:pastecmd
  endif
  call setreg(a:regname, getreg(a:regname), reg_type)
endfunction
nmap <Leader>lP :call Paste(v:register, "l", "P")<CR>
nmap <Leader>lp :call Paste(v:register, "l", "p")<CR>
nmap <Leader>cP :call Paste(v:register, "v", "P")<CR>
nmap <Leader>cp :call Paste(v:register, "v", "p")<CR>

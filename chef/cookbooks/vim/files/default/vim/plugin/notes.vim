function! s:process(txt)
  let str = shellescape(strftime('%c') . ': '. a:txt)
  let cmd = "echo " . str . " >> ~/.notes.txt"
  let return = system(cmd)
endfunction

" WIP
function! s:open()
endfunction

" filetype
" syntax handling

command! -nargs=1 Note call s:process(<q-args>)
command! -nargs=1 NoteOpen call s:open()

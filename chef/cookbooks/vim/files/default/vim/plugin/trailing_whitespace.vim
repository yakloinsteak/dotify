if exists("g:loaded_trailing_whitespace")
  finish
endif
let g:loaded_trailing_whitespace = 1

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

if has("autocmd")
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

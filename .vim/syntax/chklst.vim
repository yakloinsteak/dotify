" Vim syntax file
" Language: Checklist
" Maintainer: Christopher Truett
" Latest Revision: 05/24/2011

"if !exists("main_syntax")
  "if version < 600
    "syntax clear
  "elseif exists("b:current_syntax")
    "finish
  "endif
  "let main_syntax = 'chklst'
"endif

if exists("b:current_syntax")
  finish
endif

" Keep these disabled for now
setlocal foldmethod=indent

exe 'normal zR'
exe 'g!//s/- /+ /g'

" Matches
syn match checkBox /^\s*\* / skipwhite
syn match checkedBox /^\s*\[\(-\|\*\)] .*/ skipwhite
syn match plus /^+ / skipwhite
syn match minus /^-..*/ skipwhite
syn match emph /^..*!/ skipwhite

hi link checkBox Type
hi link checkedBox Comment
hi link minus Statement
hi link plus PreProc
hi link emph Error

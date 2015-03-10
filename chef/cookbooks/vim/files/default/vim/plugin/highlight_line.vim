"with your cursor on a line or a block selected, type `:HL`
"to remove, on each line call :sign unplace
highlight HL ctermbg=darkgray
sign define hl linehl=HL
let s:highlightLineSignId = 74000
function! g:HighlightLine()
  execute 'sign place' s:highlightLineSignId 'line='.line(".") 'name=hl' 'file='.expand("%")
  let s:highlightLineSignId += 1
endfunction
command! HL call g:HighlightLine()
command! UHL sign unplace

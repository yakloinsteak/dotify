" (R)spec mappings"

map  <buffer> <leader>rp j?it..*do<CR>jvirs{<esc>:noh<cr>Ipending <esc>
nmap <buffer> <leader>rt <Plug>SendTestToTmux
nmap <buffer> <leader>rT <Plug>SendFocusedTestToTmux

function! MyFoldText()
  let line = getline(v:foldstart)
  let line_count = v:foldend - v:foldstart + 1
  let sub = substitute(line, 'do$\|"', '', 'g')
  let sub = substitute(sub, '^ *', '', 1)
  "return v:folddashes . sub . '[' . line_count . ']'
  return '---- ' . sub . '[' . line_count . ']'
endfunction
setlocal foldtext=MyFoldText()

setlocal expandtab

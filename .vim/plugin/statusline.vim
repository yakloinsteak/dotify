"set rtp+=/home/blackman/.dotify/powerline/powerline/bindings/vim

"finish

"define 3 custom highlight groups
hi User1 ctermbg=black ctermfg=red guibg=yellow guifg=red
hi User2 ctermbg=red ctermfg=blue  guibg=red   guifg=blue
hi User3 ctermbg=black ctermfg=blue guibg=blue  guifg=green
hi User4 ctermbg=black ctermfg=yellow guibg=black guifg=yellow

let g:gitbranch = 'N/A'

function! SetBranch()
  let l:gitbranch=substitute(system("git branch --no-color | grep --color=never '*' | cut -d' ' -f2"), '\n', '', '')
  if l:gitbranch =~ 'fatal'
    let g:gitbranch = 'N/A'
  else
    let g:gitbranch = l:gitbranch
  endif
endfunction

" TODO: strip everything and including prj before the %F operator (probably
" need to use autocomamnds)
augroup statusline
  autocmd!
  au BufEnter,FileChangedShell,CursorHold * call SetBranch()
augroup END

function! TrimPath()
  let truncated_path = substitute(expand('%:p'),'\v.+/prj/','','')
  let parts          = split(truncated_path, '/')
  let lcv            = len(parts)-1
  let x              = 1

  while x<lcv
    let parts[x] = substitute(parts[x], '\v(..).*', '\1', '')
    let x += 1
  endwhile

  return join(parts, '/')
endfunction

set statusline=                              " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number

set statusline+=∈:%{TrimPath()}∋\    " file name working directory
set statusline+=%3*                          " switch to User1 highlight
set statusline+=%m                           " modified flags
set statusline+=%*                           " switch to default highlight
set statusline+=%h%r%w                       " other flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align

set statusline+=%4*                          " switch to User4 highlight
set statusline+=«%{g:gitbranch}»

set statusline+=%*                           " switch to default highlight
set statusline+=\ %3b,0x%-4B\                " current char

set statusline+=%3*                          " switch to User3 highlight
set statusline+=%-7.(%l,%c%V%)\ %<%P         " offset

" Vim filetype plugin
" Language:  Ruby
" Maintainer:  Todd Blackman
" Last Change:  2013 Apr 30

function! s:set_breakpoint()
  execute "normal! Orequire 'ruby-debug/debugger'; z=3\<ESC>:w\<CR>"
endfunction

command! -buffer -nargs=0 Break call s:set_breakpoint()

" Run highlighted code through the debugger
vnoremap <buffer> try :w! .bug.rb<cr><esc>:!rdebug .bug.rb<cr>

nnoremap <buffer> <silent> <leader>br :call todd_ruby#RdebugString()<cr>
nnoremap <buffer> <silent> <leader>l :call todd_ruby#LoadString()<cr>

command! -buffer -nargs=0 Spec exe('!rspec '. bufname('%') . ':' . line('.'))

" Open spec file (like rails plugin AV but with creation)
command! AVC call todd_ruby#BuildSpecFile()

setlocal foldignore=

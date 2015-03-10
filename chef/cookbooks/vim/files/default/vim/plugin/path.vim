" To be finished...
function! SetPath()
  let codedir = getcwd()
  "if codedir == '/home/blackman/prj/web'
    exe 'set path=,,'
    exe 'set path+='.codedir.'/app/**'
    exe 'set path+='.codedir.'/lib/**'
  "endif
endfunction

augroup test_path_set
  autocmd!
  au BufEnter *.rb call SetPath()
augroup END

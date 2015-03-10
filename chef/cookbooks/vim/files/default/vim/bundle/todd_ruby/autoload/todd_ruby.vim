if exists("g:loaded_todd_ruby") || &cp
  finish
endif
let g:loaded_todd_ruby = 1

" TODO: paths not hard-coded to blackman's setup
"command! AVC :exe 'vsplit ' . substitute(substitute(expand('%:r') . '_spec.rb', 'app', 'spec', ''), 'lib', 'spec/lib', '')
function! todd_ruby#BuildSpecFile()
  let model = expand('%:t:r')
  let model = substitute(model, '_\(.\)', '_\u\1', 'g') " post underscore letters to uppercase
  let model = substitute(model, '^\(.\)', '\u\1', '')   "first character uppercase
  let model = substitute(model, '_', '', 'g')           "squash underscores

  let spec_file = substitute(substitute(expand('%:r') . '_spec.rb', 'app', 'spec', ''), 'lib', 'spec/lib', '')
  let template_file = '~/.vim/templates/specs.tpl'

  execute 'vsplit ' . spec_file
  execute 'read ' . template_file
  execute '1d'
  execute '%s/CLASS/' . model . '/'
endfunction

function! todd_ruby#RubyFold()
  if (exists("b:ruby_folded"))
    return
  endif
  let b:ruby_folded = 1

  setlocal foldenable
  setlocal expandtab
  setlocal foldmethod=syntax
  execute 'silent! %foldopen!'
  " FIXME: fails for def inside of a def
  execute  'silent g/\v^\s+(def |it .+do|task |Factory )/foldc'
endfunction

function! todd_ruby#RdebugString()
  let rdebug_filename = bufname("%")
  let rdebug_line     = line('.')
  let rdebug_cmd      = 'break ' . rdebug_filename . ':' . rdebug_line
  call system("tmux set-buffer '" . rdebug_cmd . "'" )
endfunction

function! todd_ruby#LoadString()
  let filename = bufname("%")
  let cmd      = 'load "' . filename . '"'
  call system("tmux set-buffer '" . cmd . "'")
  call system("tmux paste-buffer -d -b 0 -t :3.0")
endfunction

" Function to allow snippets of other languages inside ruby (like SQL)
function! todd_ruby#TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

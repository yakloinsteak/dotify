" Vim filetype plugin
" Language:    Ruby
" Maintainer:  Todd Blackman
" Last Change: 2013 Apr 30

if has("autocmd")
  augroup todd_ruby
    autocmd!

    autocmd FileType ruby call todd_ruby#RubyFold()

  augroup END
endif

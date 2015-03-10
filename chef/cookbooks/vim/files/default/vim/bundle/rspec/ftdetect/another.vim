if exists("b:did_ftplugin")
  finish
endif

setlocal expandtab

" Behave just like Ruby
runtime! ftplugin/ruby.vim

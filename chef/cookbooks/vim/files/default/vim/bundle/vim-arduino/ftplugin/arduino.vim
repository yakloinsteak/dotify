if exists("b:did_ftplugin")
  finish
endif

" Behave like cpp
runtime! ftplugin/cpp.vim

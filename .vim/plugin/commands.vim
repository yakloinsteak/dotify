" FIXME: Not correct, but I want this
command! Reopen vsplit #

command! Preview !bluecloth\ %\ \|elinks

command! Syntax source ~/.vim/plugin/color_choice.vim

" Write to a file if you forgot to become root/whatever first.
command! Swrite :w !sudo dd of=%

" only command loses syntax highlighting
command! On only|edit

" Annotate (typically a git commit buffer) with PT URL, etc.
command! PT :.!pt

" Run this with `pg_restore -l` output open
command! FilterPostGIS :g/FUNCTION\|SHELL\|COMMENT\|VIEW\|TYPE\|OPERATOR\|CAST\|spatial_ref\|geometry_columns\|delete_me\|AGGREGATE\|EXTENSION/d

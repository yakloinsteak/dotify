" WIP

if exists("b:did_gitcommit_ftplugin")
  finish
endif
"let b:did_gitcommit_ftplugin = 1

function! s:setProjectId(project_id)
endfunction

function! s:getCommit()
endfunction

function! s:getStoryId()
endfunction

function! s:pushComment(text)
endfunction

"command! -complete=customlist,s:choiceComplete -nargs=1 Color execute("call s:setColors('<args>')")

command! -buffer Record echom "plugin did Record!"
command! -buffer Complete echom "plugin did Complete!"

command! -buffer Bundle echom "plugin did Bundle!"
command! -buffer Migrate echom "plugin did Migrate!"

setlocal nolist

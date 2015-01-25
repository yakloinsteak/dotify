" Include keyword in completion
set complete-=k complete+=k
set complete+=t

set completeopt=longest,menuone

" Global lookups that apply across all file types.
set thesaurus+=~/.vim/mthesaur.txt
set dictionary+=~/.vim/dictionary.txt

" Filename completion otherwise user if completefunc set otherwise omni if omnifunc set... I think...
let g:SuperTabDefaultCompletionType='context'

" Fallback if context completion fails (lookup in dictionary)
let g:SuperTabContextDefaultCompletionType='<c-x><c-k>'

" improve autocomplete menu color
" highlight Pmenu ctermfg=232 ctermbg=197 gui=bold

"function! MyTagContext()
"  if filereadable(getcwd() . '/tags') || filereadable(getcwd() . '/tmp/tags') || filereadable(expand('%:p:h') . '/tmp/tags') || filereadable(expand('%:p:h') . '/tags')
"    return "\<c-x>\<c-]>"
"  endif
"  " no return will result in the evaluation of the next configured context
"endfunction

" Merge keyword (dictionary) lookup with ctag lookup
function! KeywordTagComplete(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " wip:
    "find months matching with "a:base"
    "let res = []
    "for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
      "if m =~ '^' . a:base
        "call add(res, m)
      "endif
    "endfor
    "return res
  endif
endfunction
"set completefunc=KeywordTagComplete

"let g:SuperTabCompletionContexts=['s:ContextText', 'MyTagContext']
let g:SuperTabCompletionContexts=['s:ContextText']

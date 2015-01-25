setlocal dictionary+=$HOME/.vim/bundle/todd_ruby/dictionary.txt

" Make ruby thesaurus the first choice
let s:thes = &thesaurus
setlocal thesaurus+=$HOME/.vim/bundle/todd_ruby/thesaurus.txt
exe 'setlocal thesaurus+=' . s:thes

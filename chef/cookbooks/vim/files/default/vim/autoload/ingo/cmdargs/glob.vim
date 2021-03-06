" ingo/cmdargs/glob.vim: Functions for expanding file glob arguments.
"
" DEPENDENCIES:
"   - ingo/cmdargs/file.vim autoload script
"
" Copyright: (C) 2012-2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.007.001	01-Jun-2013	file creation from ingofileargs.vim

function! ingo#cmdargs#glob#ExpandSingle( fileglob, ... )
"******************************************************************************
"* PURPOSE:
"   Expand any file wildcards in a:fileglob to a list of normal filespecs.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   a:fileglob  File glob (already processed by
"		ingo#cmdargs#file#Unescape()).
"   a:isKeepNoMatch Optional flag that lets globs that have no matches be kept
"		    and returned as-is, instead of being removed. Set this when
"		    you want to support creating new files.
"* RETURN VALUES:
"   List of normal filespecs; globs have been expanded. To consume this in
"   another Vim command, use:
"	join(map(l:filespecs, 'fnameescape(v:val)))
"******************************************************************************
    " XXX: Special Vim variables are expanded by -complete=file, but (in Vim
    " 7.3), escaped special names are _not_ correctly re-escaped, and a
    " following glob() or expand() will mistakenly expand them. Because of the
    " auto-expansion, any unescaped special Vim variable that gets here is in
    " fact a literal special filename. We don't even need to re-escape and
    " glob() it, just return it verbatim.
    if a:fileglob =~# '^\%(%\|#\d\?\)\%(:\a\)*$\|^<\%(cfile\|cword\|cWORD\)>\%(:\a\)*$'
	return [a:fileglob]
    else
	" Filter out directories; we're usually only interested in files.
	return filter(split((a:0 && a:1 ? expand(a:fileglob) : glob(a:fileglob)), "\n"), '! isdirectory(v:val)')
    endif
endfunction
function! ingo#cmdargs#glob#Expand( fileglobs, ... )
"******************************************************************************
"* PURPOSE:
"   Expand any file wildcards in a:fileglobs to a list of normal filespecs.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   a:fileglobs Either space-separated arguments string (from a :command
"		-complete=file ... <q-args> custom command), or a list of
"		fileglobs (already processed by
"		ingo#cmdargs#file#Unescape()).
"   a:isKeepNoMatch Optional flag that lets globs that have no matches be kept
"		    and returned as-is, instead of being removed. Set this when
"		    you want to support creating new files.
"* RETURN VALUES:
"   List of filespecs; globs have been expanded. To consume this in another Vim
"   command, use:
"	join(map(l:filespecs, 'fnameescape(v:val)))
"******************************************************************************
    let l:fileglobs = (type(a:fileglobs) == type([]) ? a:fileglobs : ingo#cmdargs#file#SplitAndUnescape(a:fileglobs))

    let l:filespecs = []
    for l:fileglob in l:fileglobs
	call extend(l:filespecs, call('ingo#cmdargs#glob#ExpandSingle', [l:fileglob] + a:000))
    endfor
    return l:filespecs
endfunction

function! s:ContainsNoWildcards( fileglob )
    " Note: This is only an empirical approximation; it is not perfect.
    if has('win32') || has('win64')
	return a:fileglob !~ '[*?]'
    else
	return a:fileglob !~ '\\\@<![*?{[]'
    endif
endfunction
function! ingo#cmdargs#glob#Resolve( fileglobs )
"*******************************************************************************
"* PURPOSE:
"   Expand any file wildcards in a:fileglobs, convert to normal filespecs
"   and assemble file statistics. Like ingo#cmdargs#glob#Expand(), but
"   additionally returns statistics.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   a:fileglobs Raw list of file patterns.
"* RETURN VALUES:
"   [l:filespecs, l:statistics]	First element is a list of the resolved
"   filespecs (in normal, not Ex syntax), second element is a dictionary
"   containing the file statistics.
"*******************************************************************************
    let l:statistics = { 'files': 0, 'removed': 0, 'nonexisting': 0 }
    let l:filespecs = []
    for l:fileglob in a:fileglobs
	let l:resolvedFilespecs = ingo#cmdargs#glob#ExpandSingle(l:fileglob)
	if empty(l:resolvedFilespecs)
	    " To treat the file pattern as a filespec, we must emulate one
	    " effect of glob(): It removes superfluous escaping of spaces in the
	    " filespec (but leaves other escaped characters like 'C:\\foo'
	    " as-is). Without this substitution, the filereadable() check won't
	    " work.
	    let l:normalizedPotentialFilespec = substitute(l:fileglob, '\\\@<!\\ ', ' ', 'g')

	    " The globbing yielded no files; however:
	    if filereadable(l:normalizedPotentialFilespec)
		" a) The file pattern itself represents an existing file. This
		"    happens if a file is passed that matches one of the
		"    'wildignore' patterns. In this case, as the file has been
		"    explicitly passed to us, we include it.
		let l:filespecs += [l:normalizedPotentialFilespec]
	    elseif s:ContainsNoWildcards(l:fileglob)
		" b) The file pattern contains no wildcards and represents a
		"    to-be-created file.
		let l:filespecs += [l:fileglob]
		let l:statistics.nonexisting += 1
	    else
		" Nothing matched this file pattern, or whatever matched is
		" covered by the 'wildignore' patterns and not a file itself.
		let l:statistics.removed += 1
	    endif
	else
	    " We include whatever the globbing returned; 'wildignore' patterns
	    " are filtered out.
	    let l:filespecs += l:resolvedFilespecs
	endif
    endfor

    let l:statistics.files = len(l:filespecs)
    return [l:filespecs, l:statistics]
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :

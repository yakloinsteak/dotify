setlocal foldtext=RubyFoldText()
"setlocal foldexpr=RubyMethodFold(v:lnum)
"setlocal foldexpr=GetRubyFold(v:lnum)
"setlocal foldmethod=expr


"function! RubyMethodFold(line)
  "let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
  "let line_is_def = getline(a:line) =~ '\s*def '
  "return line_is_method_or_end || line_is_def
"endfunction

function! RubyFoldText()
  let line_num = NextNonBlankLine(v:foldstart)

  " Need first non-empty line instead:
  let desc = getline(v:foldstart)
  let desc = getline(line_num)

  let line_count = printf("%2d", v:foldend - v:foldstart + 1)

  " Setup leading space
  let lcv = 2
  let dashes = ''
  while (lcv < indent(line_num))
    let dashes = dashes . ' '
    let lcv += 1
  endwhile

  " Craft the perfect descriptor line
  let sub = substitute(desc, 'do$\|"', '', 'g')
  let sub = substitute(sub, '^ *', '', 1)

  return dashes . '  ' . line_count . '» ' . sub . ' '
endfunction

"function! NextNonBlankLine(lnum)
  "let numlines = line('$')
  "let current = a:lnum

  "while current <= numlines
    "if getline(current) =~? '\v\S'
      "return current
    "endif

    "let current += 1
  "endwhile

  "return -2
"endfunction

"function! IndentLevel(lnum)
  "return indent(a:lnum) / &shiftwidth
"endfunction

"function! NextSameIndent(lnum)
  "let numlines = line('$')
  "let current = a:lnum + 1
  "let current_indent = IndentLevel(lnum)

  "while current <= numlines
    "if IndentLevel(current)
      "return current
    "endif

    "let current += 1
  "endwhile

  "return -2
"endfunction

"function! GetRubyFold(lnum)
  ""let &debug = 'msg'

  "" Classes and modules never indent
  "if getline(a:lnum) =~? '\v^\s*(module|class|describe|context|require) '
    "return '0'
  "endif

  "if getline(a:lnum) =~? '\v^\s*(def|it|before|specify|desc) '
    "return '1'
  "endif

  "" Last line triggers folding.
 "if a:lnum == line('$')
    "return '<1'
  "endif

  "if getline(a:lnum+1) =~? '\v^\s*(def |private|protected|it|context|describe|desc).*$'
    "return '<1'
  "endif

  "" -1 means undefined
  "if getline(a:lnum) =~? '\v^\s*$'
    "return '-1'
  "endif

  "return '-1'
"endfunction

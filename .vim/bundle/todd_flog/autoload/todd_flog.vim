let s:low_color        = "#a5c261"
let s:medium_color     = "#ffc66d"
let s:high_color       = "#cc7833"
let s:background_color = "#323232"
let s:medium_limit     = 20
let s:high_limit       = 35

if exists("g:flog_low_color")
  let s:low_color = g:flog_low_color
endif

if exists("g:flog_medium_color")
  let s:medium_color = g:flog_medium_color
endif

if exists("g:flog_high_color")
  let s:high_color = g:flog_high_color
endif

if exists("g:flog_background_color")
  let s:background_color = g:flog_background_color
endif

if exists("g:flog_medium_limit")
  let s:medium_limit = g:flog_medium_limit
endif

if exists("g:flog_high_limit")
  let s:high_limit = g:flog_high_limit
endif

"function! s:UpdateHighlighting()
  "exe 'hi low_complexity    guifg='.s:low_color
  "exe 'hi medium_complexity guifg='.s:medium_color
  "exe 'hi high_complexity   guifg='.s:high_color
  "exe 'hi SignColumn        guifg=#999999 guibg='.s:background_color.' gui=NONE'
"endfunction

function! s:ParseFlogToList()
  let cmd    = "flog -ca " . expand('%') . " | grep '.rb' | sed -e 's/::/__/g' | sed -e 's/:/ /g' | awk '{print $1 \" \" $4}'"
  let parts  = split(system(cmd), '\n')
  let result = []
  for entry in parts
    let data = split(entry)
    let score = float2nr(round(str2float(data[0])))
    let aline = data[1]
    "echom "On line " . aline . " the score was " . score
    let result = add(result, [aline, score])
  endfor
  return result
endfunction

sign define tf_safe     text=✓✓ texthl=Title
sign define tf_overflow text=✗✗ texthl=Error

function! todd_flog#Update()
  let lcv = 1
  for entry in s:ParseFlogToList()
    if entry[1] < s:medium_limit
      let name = 'tf_safe'
    elseif entry[1] < s:high_limit
      let name = "tf_" . lcv
      exe "sign define " . name . " text=" . entry[1] . " texthl=Type"
    elseif entry[1] < 100
      let name = "tf_" . lcv
      exe "sign define " . name . " text=" . entry[1] . " texthl=Character"
    else
      let name = 'tf_overflow'
    endif
   exe "sign place " . str2nr(lcv) . " line=" . entry[0] . " name=" . name . " file=" . expand("%:p")
    let lcv += 1
  endfor
endfunction

function! todd_flog#Off()
  sign unplace *
endfunction

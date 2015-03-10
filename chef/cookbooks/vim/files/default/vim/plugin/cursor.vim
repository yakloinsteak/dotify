"if &term =~ "xterm\\|rxvt\\|screen"
  "" use an orange cursor in insert mode
  "set t_SI="\<Esc>]12;orange\x7"
  "" use a red cursor otherwise
  "set t_EI="\<Esc>]12;red\x7"
  "silent !echo -ne "\033]12;red\007"
  "" reset cursor when vim exits
  "autocmd VimLeave * silent !echo -ne "\033]112\007"
  "" use \003]12;gray\007 for gnome-terminal
"endif

"if &term =~ '^xterm'
  "" solid underscore
  "let &t_SI .= "\<Esc>[4 q"
  "" solid block
  "let &t_EI .= "\<Esc>[2 q"
  "" 1 or 0 -> blinking block
  "" 3 -> blinking underscore
"endif

function! s:setColors(mode)
  " TODO: set this based on hostname?
  set t_Co=256

  if a:mode == 'bright'
    echon "Assuming a white background for outdoor lighting"
    set background=light
    syntax on
    colorscheme zellner
  elseif &t_Co > 2 || has("gui_running")
    echon 'doing dark colorscheme'
    "let g:jellybeans_background_color_256=16
    set background=dark
    syntax on

    let g:jellybeans_overrides = {
      \ 'WildMenu': { 'guifg': '300030', 'guibg': 'f0f000',
      \   'ctermfg': 9, 'ctermbg': 'Yellow',
      \   'attr': 'bold' },
      \ 'NonText': { 'ctermbg': 'Black' },
      \ 'Normal': { 'ctermbg': 'Black' }
    \}

    colorscheme jellybeans
    highlight Normal ctermbg=016
    highlight NonText ctermbg=016
    highlight SignColumn ctermbg=016

    if has("autocmd")
      augroup todd_syntax
        autocmd!
        autocmd Syntax,FileType * highlight Normal ctermbg=016 | highlight NonText ctermbg=016
        "autocmd BufReadPre * call s:slowSyntax()
      augroup END
    endif
  endif
endfunction

function! s:slowSyntax()
  " turn syntax off if file is a known slow one.
  " getfsize(%)
endfunction

function! s:choiceComplete(arg_lead, cmd_line, cursor_pos)
  return ['bright', 'dark']
endfunction

call s:setColors('dark')

command! -complete=customlist,s:choiceComplete -nargs=1 Color execute("call s:setColors('<args>')")

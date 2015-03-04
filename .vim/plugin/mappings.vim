" My key bindings and abbreviations
let mapleader = ','
let maplocalleader = '\\'

" slime config
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <c-c>r :SlimeConfig<CR>

" Visual extend selection to top or bottom.
vnoremap K 2000k
vnoremap J 2000j

" Comments
vmap <silent> <Leader>del :!~/.vim/ruby/aligned_comment.rb DEL:<CR>
"vmap <silent> <Leader>, :!~/.vim/ruby/aligned_comment.rb<CR>
vmap <silent> <Leader>, <plug>NERDCommenterToggle

"map <leader>q :bufdo!q<cr>
map <leader>n :NERDTreeToggle %:p:h<cr>
map <leader>lat :r ~/.latin.haml<CR>
map <leader>nonuni /[^a-zA-Z0-9;",%'';\- /	.:()&\[=\]\ #+’]

map <silent> <leader>s :set spell!<cr>

" rspec and rails integration
map <leader>sp :Rcd<cr>:!sort -u tmp/quickfix > tmp/quickfix.sort<cr>:tabnew<CR>:cfile tmp/quickfix.sort<cr>:cope<CR>
map <leader>mock :redit spec/support/mocks.rb<cr>
map <leader>fac :redit spec/support/factories.rb<cr>
map <leader>mat :redit spec/support/matchers.rb<cr>
map <leader>do <esc>A do<cr>end<cr><esc>kko
vmap <leader>ha :!~/.vim/scripts/new_hash.rb<cr>

" To paste mode and back.
set pastetoggle=<leader>p

" to eol but not including eol
map <leader>e g_

" Select all text and do various things
map <leader>ay :0,$y
map <leader>av <esc>ggVG
" Reformat the file
map <leader>af <esc>ggVG=

" Paste a full line without newline
" map <leader>P i<cr><esc>kp<esc>kJJx<esc>

" Clean a line of leading and trailing whitespace in a string.
map <leader>cl :s/\(["']\) *\<\(..*\)\> *\1/\1\2\1/<CR>

" Clear out highlighed search
noremap <leader><space> :noh<cr>

" Save all windows when saving
map <F1> :windo w<CR>
map <F2> :YRShow<CR>
map <F3> :GDiff
map <F4> :botright copen<CR>
map <F5> :cclose
map <F6> :GBlame
map <F7> :GBlame
map <F8> :GBlame
map <F9> :GBlame
map <F10> :GBlame
map <F11> :GBlame
map <F12> :GBlame

" current path
map <leader>cd :lcd %:p:h<cr>
cabbr <expr> %% expand('%:p:h')

" Make <leader>tl go to last tab
let g:lasttab = 1
nmap <space><space> :exe "tabn ".g:lasttab<CR>
augroup todd_tab
  autocmd!
  au TabLeave * let g:lasttab = tabpagenr()
augroup END

" Get out of insert mode by typing 'jk' then force yourself to use it!
inoremap jk <ESC>
inoremap kj <ESC>

" Auto-pair-completion. delimiteMate is too heavy.
inoremap (( ()<esc>ha
inoremap {{ {}<esc>ha
inoremap [[ []<esc>ha
inoremap "" ""<esc>ha
inoremap '' ''<esc>ha
inoremap <bar><bar> <bar><bar><esc>ha

" Delete whole line into blackhole
nmap <del> <esc>^"_D

" Make listing buffers prompt you for the buffer number to open in a new tab
cnoremap t# ls<cr>:tabedit #
cnoremap e# ls<cr>:edit #
cnoremap v# ls<cr>:vertical split #
cnoremap s# ls<cr>:split #

" Do regex expressions the real way and not the vim way. No more extra slashes!
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Highlight last pasted text
nnoremap <leader>v V`]

" Window and tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>J
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't use arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" splits
nnoremap s <esc>:split<cr>
nnoremap ss <esc>:vsplit<cr>

" j/k act like normal, but on a wrapped line, it behaves like each
" continuation is its own line.
nnoremap j gj
nnoremap k gk

" Navigate the undo tree
nnoremap U :GundoToggle<CR>

" Toggle wrap status
map <leader>w :set invwrap<CR>

" Make sourcing this file really easy
nnoremap <leader>ev :vsplit $HOME/.vim/plugin/mappings.vim<cr>G
nnoremap <leader>sv :source $HOME/.vim/plugin/mappings.vim<cr>

" Dumping ground for on the fly mappings:

noremap asdf :tabdo w
noremap ;lkj :windo w

" Tired of my palm hitting the touchpad.
nnoremap <ScrollWheelUp> <c-o>
nnoremap <ScrollWheelDown> <c-i>

nnoremap !! :tabe \| cfile tmp/rspec.vim \| copen<CR>

noremap cc :set paste<cr>o

" ^l redraws correctly. I think this is a incompatibility between my zsh
" mapping and vim.
map  <esc>:redraw!<cr>

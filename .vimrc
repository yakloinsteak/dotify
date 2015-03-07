" Tab and indent settings
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set tabstop=2
set autoindent
set textwidth=100

let g:rails_ctags_arguments='--exclude="*.js" --regex-Ruby="/\(named_scope\|has_many\|has_and_belongs_to_many\|belongs_to\)\ :\([A-z]\+\)\ *,/\\2/e" --exclude="*.sql" --exclude=.git --exclude=log --exclude=tmp --exclude=import --exclude=spec'
let g:no_turbux_mappings = 1

let g:autofenc_autodetect_num_of_lines=2

"let g:session_additional_names_function = 'xolox#save_default#get_git_branch'
"let g:session_directory="./tmp/vim-sessions"
"let g:session_autosave = 'no'

" Ruby doc config
let g:ruby_doc_command='chromium-browser'

" snippet configuration
let g:UltiSnipsSnippetDirectories=["ulti_snippets"]
let g:UltiSnipsExpandTrigger="<tab><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab><tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Eclim
" start eclim server (eclimd)
" No trailing slash in path:
" :ProjectCreate <path-to-your-project> -n ruby
let g:EclimCompletionMethod = 'omnifunc'

" Easy motion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" Additional error formats
" Cucumber
set errorformat+=%f:%l\ %m

" diff anotation from revision control.
" Don't run Sy by default. You can toggle it anytime via :SignifyToggle.
"let g:signify_vcs_list = [ 'git' ]
"let g:signify_sign_overwrite = 0
"let g:signify_diffoptions = { 'git': '-w --cached', 'hg': '-w' }
"let g:signify_disable_by_default = 1

" Control-p
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_dotfiles = 0 " Don't scan for dotfiles
let g:ctrlp_mruf_max = 15
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:30'

" Syntastic markers
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='✠'

" Slime
let g:slime_target = "tmux"
let g:slime_paste_file = "~/.slime.txt"

" MRU
" let MRU_Max_Entries = 10
" let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" Postgresql configuration
let g:sql_type_default = 'postgresql'

" paren matching in ms
let g:matchparen_insert_timeout=10

" Misc.
set nocompatible
set visualbell
set number
set ruler
set nowrap
set showcmd
set showmode
set hidden
set list
set cursorline
set listchars=tab:>-,trail:$
set timeoutlen=500
set ttimeoutlen=12
set maxmempattern=10000
set splitbelow
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.o,*.jpg,*.gif,.git
set nolazyredraw
set modelines=0
set ttyfast
set laststatus=2
if version >= 703
  set undofile
endif
set mouse=a
set nobackup
set noswapfile
" can't get to work: set switchbuf=usetab

" Make file changes automatic without having to reload a file (like when you
" switch to a different git branch.
set autoread

" don't try to syntax highlight really long lines. SQL dumps are a prime example
set synmaxcol=200

" Include keyword in completion
set complete-=k complete+=k

" Scrolling
set scrolloff=4
set sidescrolloff=10
set sidescroll=20

" Searching. lowercase gets both cases, upper just get upper.
set ignorecase
set smartcase
set incsearch
set hlsearch
set noshowmatch " Don't jump to the matching paren, etc.

" Yanks and deletes go to clipboard. Clipboard middle-click goes to paste buffer
set clipboard=unnamed,unnamedplus

if has("autocmd")
  call pathogen#infect()
endif

" Turn on file-type based indentation
filetype plugin indent on

" Folding
set foldmethod=syntax
set foldnestmax=8
set foldlevel=2
set foldclose=""

" Encodings
set encoding=utf-8 fileencodings=
if version >= 703
  set cm=blowfish
endif

" Diffing
set diffopt+=iwhite

set undodir=~blackman/tmp,./tmp,../tmp,../../tmp,.

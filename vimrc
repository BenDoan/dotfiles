call plug#begin('~/.vim/plugged')

Plug 'bkad/CamelCaseMotion'
Plug 'bling/vim-airline'
Plug 'bruno-/vim-husk'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'fatih/vim-go'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'
Plug 'mattn/emmet-vim'
Plug 'osyo-manga/vim-over'
Plug 'qnighy/lalrpop.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/badwolf'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

call plug#end()

behave xterm

filetype plugin on
filetype plugin indent on

set hidden   "Doesn't close buffers
set history=1000  " remember more commands and search history
set nobackup
set backupcopy=yes
set noswapfile
set backspace=indent,eol,start "fixes backspacing in normal mode
set modeline
set modeline "reads modelines, eg: '# vim: set ai tw=75'
set noeb vb t_vb= "Stops screen flashing
set nofoldenable "disables code folding

set autowrite "saves the current file on certain actions
set mouse=a "enables mouse for all modes
set showcmd "shows uncompleted commands in the status bar
set cursorline "highlights cursor line
set ttyfast "fast terminal connection
set showmode "shows the current mode
set laststatus=2 "status line is always on
set gdefault "search/replace is globally done on a line by default
set number "static line numbers
set clipboard=unnamed
set linebreak "wraps text, no eols
set scrolloff=2 "minscrollspace above/below cursor
set cmdheight=1 "sets command window at bottom
set showmatch "Jumps to matching paren
set mat=5 "how long to show matching parens
set cpoptions+=ces$ "keeps text visible while using the change action
set lazyredraw "don't update screen when execing macros
set synmaxcol=800 "don't highlight long lines
set splitright
set splitbelow
set iskeyword+=\- " include dashes in autocomplete
set notimeout
set ttimeout
set ttimeoutlen=10


augroup autocmds
    autocmd!

    au BufWritePre * silent g/\s\+$/s/// " Remove trailing spaces after save

    "Filetype settings
    au FileType go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType vue setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType kotlin setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType rust setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END

"Search stuff
set ignorecase
set hlsearch
set incsearch
set ignorecase
set smartcase "ignores case when for lowercase, searches by case for uppercase

"Tab stuff
set copyindent
set autoindent
set smarttab
set cindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set breakindent
set breakindentopt=min:20,shift:2

"Undo stuff
if v:version > 702
    set undodir=~/dotfiles/vimundo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"Autocomplete menu
set wildmenu
set wildmode=full

set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.luac
set wildignore+=*.pyc
set wildignore+=*.orig

if has('nvim')
    set inccommand=nosplit
endif

set background=dark
let g:badwolf_html_link_underline = 0

if has("win32")
    set guifont=Consolas:h11:cANSI
elseif has("gui")
    set guiheadroom=0
    set guifont=Source\ Code\ Pro\ 10
endif
set t_Co=256
colors badwolf

"KEY MAPS
""""""""
set pastetoggle=<F2>
let mapleader = ","

"writes a file with sudo
cmap w!! w !sudo tee % >/dev/null

"causes j and k to scroll by the visible line
nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :nohl<cr>

"Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Selects the last pasted text
nnoremap gp `[v`]

" copies until end of line
nmap Y y$

" Center the line that the search result is on
map N Nzz
map n nzz

" disables help key
map! <F1> <Esc>

"keeps the visual selection when you tab a piece of text over
vnoremap < <gv
vnoremap > >gv

"keeps the cursor in the same place when joining lines
nnoremap J mzJ`z

" disable :X
cmap X<CR> x<CR>

noremap  <C-C> <Esc>
inoremap <C-C> <Esc>

function ToggleJSSpec()
  let ending = expand("%:t") =~ "\.spec\.js" ? ".js" : ".spec.js"
  let file = system('git ls-files | grep -m1 "/$(echo ' . expand("%:t") . ' | cut -d. -f1)' . ending .'"')
  execute 'edit' file
endfunction
noremap <leader>tt :call ToggleJSSpec()<CR>


"PLUGINS
"""""""""""""""
"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"FZF
nnoremap <space> :FZF<CR>

"Emmet
let g:user_emmet_leader_key='<C-e>'

nmap <Enter> :ALENext<CR>

let g:ale_linters = {
\   'scala': ['scalac'],
\   'java': ['checkstyle'],
\   'python': ['flake8'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'rust': ['rustfmt'],
\}

let g:ale_python_mypy_options='--ignore-missing-imports'
let g:ale_python_pylint_options='--disable=invalid-name,missing-docstring'
let g:ale_python_flake8_options='--ignore=E501'
let g:ale_fix_on_save = 1

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ }

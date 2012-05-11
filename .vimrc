call pathogen#infect()

behave xterm

filetype plugin on
filetype plugin indent on

set hidden   "Doesn't close buffers
set history=1000         " remember more commands and search history
set nobackup
set noswapfile
set backspace=indent,eol,start "fixes backspacing in normal mode
set guioptions-=T  "remove menu bar

"Stops screen flashing
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set nofoldenable "disables folding

set autoread "automatically reads a file once it has been changed
"set virtualedit=all "can edit anywhere
set mouse=a
set showcmd "shows uncompleted commands in the status bar
set cursorline "highlights cursor line
set ttyfast "fast terminal connection
set showmode "shows the current mode
set laststatus=2 "status line is always on
set gdefault "search/replace is globally done on a line by default
set number
"set colorcolumn=85
set clipboard=unnamed
set autochdir "cd into the dir of the current file
set linebreak "wraps text, no eols
set scrolloff=2   "scrollspace above cursor
set cmdheight=1 "sets command window at bottom
set showmatch "Jumps to matching paren
set mat=5 "how long to show matching parens

if has("autocmd")
    au BufWritePre * silent g/\s\+$/s/// " Remove trailing spaces after save

    au VimEnter * ColorHighlight

    au WinEnter * setlocal cursorline "only emabled the cursorline in the active window
    au WinLeave * setlocal nocursorline

    au FocusLost * silent! :wa "saves all files when vim loses focus
    au WinLeave * silent! :wa

    au BufNewFile,BufRead *.less set filetype=less


    "make stuff
    au BufNewFile,BufRead *.php set makeprg=php\ -l\ %
    au BufNewFile,BufRead *.php set errorformat=%m\ in\ %f\ on\ line\ %l
    au BufNewFile,BufRead *.py set makeprg=python\ %
    au BufNewFile,BufRead *.go set makeprg=go\ build\ %
endif

"Search stuff
set ignorecase
set hlsearch
set incsearch
set ignorecase
set smartcase "ingnores case when for lowercase, searches by case for uppercase

"Tab stuff
set copyindent
set autoindent
set smarttab
set cindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Undo stuff
if has('unix')
    set undodir=$VIMRUNTIME\..\vimfiles\undo
else
    set undodir=~/vimundo
endif
set undofile
set undolevels=1000
set undoreload=10000

"Autocomplete menu
set wildmenu
set wildmode=longest,list:full

"Text wrapping
set wrap
set textwidth=79
set formatoptions=qcn1

"php stuff
let php_sql_query=1
let php_htmlInStrings=1


syntax enable
set background=dark
colors badwolf

if has("win32")
    set guifont=Consolas:h11:cANSI
elseif has("gui")
    set guifont="DejaVu Sans Mono 12"
else
    set t_Co=256
endif

"set list
"set listchars=eol:¬
"set listchars=tab:|

"Key Maps

set pastetoggle=<F2>
let mapleader = ","

cmap Q q
cmap W w
cmap X x
cmap w!! w !sudo tee % >/dev/null

nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :noh<cr>

"Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap gp `[v`]


map <C-V>		"+gP
cmap <C-V>		<C-R>+
imap <C-V>		<C-R>+
noremap <C-Q> <C-V>

imap jj <Esc>


vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP

noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

nmap Y y$
nmap <Leader>v :e $MYVIMRC
nmap <Leader>V :w<CR>:source $MYVIMRC

" Center the line that the search result is on
map N Nzz
map n nzz
map! <F1> <Esc>

vnoremap < <gv
vnoremap > >gv


nmap <silent> <F4>
    \ :!ctags -f ./tags
    \ --langmap="php:+.inc"
    \ -h ".php.inc" -R --totals=yes
    \ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

set tags=./tags,tags



"PLUGINS
"""""""""""""""
"Zen Coding
let g:user_zen_expandabbr_key = '<c-e>'

"Supetab
let g:SuperTabDefaultCompletionType = "context"

"Nerd Commenter
map <C-c> <plug>NERDCommenterToggle

"Nerd Tree
nmap <F8> :NERDTreeToggle <CR>

"Taglist
nmap <F7> :TlistToggle <CR>

"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e


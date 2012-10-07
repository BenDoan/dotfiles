call pathogen#infect()

behave xterm

filetype plugin on
filetype plugin indent on

set hidden   "Doesn't close buffers
set history=1000  " remember more commands and search history
set nobackup
set noswapfile
set backspace=indent,eol,start "fixes backspacing in normal mode
set guioptions-=T  "remove menu bar

set noeb vb t_vb= "Stops screen flashing
au GUIEnter * set vb t_vb=

set nofoldenable "disables folding

set autoread "automatically reads a file once it has been changed
set autowrite "saves the current file on certain actions
set mouse=a
set showcmd "shows uncompleted commands in the status bar
set cursorline "highlights cursor line
set ttyfast "fast terminal connection
set showmode "shows the current mode
set laststatus=2 "status line is always on
set gdefault "search/replace is globally done on a line by default
set number
set clipboard=unnamed
set autochdir "cd into the dir of the current file
set linebreak "wraps text, no eols
set scrolloff=2   "scrollspace above cursor
set cmdheight=1 "sets command window at bottom
set showmatch "Jumps to matching paren
set mat=5 "how long to show matching parens
set cpoptions+=ces$ "makes cw put a $ at the end instead of deleting
set lazyredraw "don't update screen when execing macros
set synmaxcol=800 "don't highlight long lines
set splitright
set splitbelow

"for terminal vim
set notimeout
set ttimeout
set ttimeoutlen=10


augroup autocmds
    autocmd!

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
augroup END

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
set undodir=~/vimundo
set undofile
set undolevels=1000
set undoreload=10000

"Autocomplete menu
set wildmenu
set wildmode=full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files


"php stuff
let php_sql_query=1
let php_htmlInStrings=1


syntax enable
set background=dark
let g:badwolf_html_link_underline = 0

if has("win32")
    set guifont=Consolas:h11:cANSI
elseif has("gui")
    set guifont=Source\ Code\ Pro\ 10
else
    set t_Co=256
endif
colors badwolf

"shows "special" characters
"set list
set listchars=eol:¬

"KEY MAPS
""""""""

set pastetoggle=<F2>
let mapleader = ","

"writes a file with sudo
cmap w!! w !sudo tee % >/dev/null

"causes j and k to scroll by the visible line
nnoremap j gj
nnoremap k gk
nnoremap <leader><space> :noh<cr>

"Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Selects the last pasted text

nnoremap gp `[v`]

nnoremap ; :


map <C-V>		"+gP
cmap <C-V>		<C-R>+
imap <C-V>		<C-R>+
noremap <C-Q> <C-V>

map <C-V> "+gP

" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

nmap Y y$
nmap <Leader>v :e $MYVIMRC
nmap <Leader>V :w<CR>:source $MYVIMRC

" Center the line that the search result is on
map N Nzz
map n nzz
map! <F1> <Esc>

"keeps the visual selection when you tab a piece of text over
vnoremap < <gv
vnoremap > >gv

nnoremap <f9> mzggg?G`z

"keeps the cursor in the same place when joining lines
nnoremap J mzJ`z

"split lines
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

"maps for ctags
if executable('ctags')
    nmap <silent> <F4>
        \ :!ctags -f ./tags
        \ --langmap="php:+.inc"
        \ -h ".php.inc" -R --totals=yes
        \ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

    set tags=./tags,tags
endif


"PLUGINS
"""""""""""""""
"Zen Coding
let g:user_zen_expandabbr_key = '<c-e>'

"Supertab
let g:SuperTabDefaultCompletionType = "context"

"Nerd Commenter
map <C-c> <plug>NERDCommenterToggle

"Nerd Tree
nmap <F8> :NERDTreeToggle <CR>

"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"CtrlP
let g:ctrlp_map = '<space>'

"Fswitch
nmap <silent> <leader>of :FSHere<cr>

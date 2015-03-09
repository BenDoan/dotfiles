syntax on
" NeoBundle Initialization
"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'bruno-/vim-husk'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'derekwyatt/vim-fswitch'
NeoBundle 'ervandew/supertab'
NeoBundle 'HorseMD/tf2syntax.vim'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'lepture/vim-jinja'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/badwolf'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'zah/nimrod.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

behave xterm

filetype plugin on
filetype plugin indent on

set hidden   "Doesn't close buffers
set history=1000  " remember more commands and search history
set nobackup
set noswapfile
set backspace=indent,eol,start "fixes backspacing in normal mode
set guioptions-=T  "remove menu bar
set modeline

set modeline "reads modelines, eg: '# vim: set ai tw=75'

set noeb vb t_vb= "Stops screen flashing
au GUIEnter * set vb t_vb=

set nofoldenable "disables code folding

set autoread "automatically reads a file once it has been changed
set autowrite "saves the current file on certain actions
set mouse=a "enables mouse for all modes
set ttymouse=xterm2
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

    "Filetypes
    au BufNewFile,BufRead *.less set filetype=less
    au BufNewFile,BufRead *.sc set filetype=scala
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
if v:version > 702
    set undodir=~/dotfiles/vimundo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

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
nnoremap <leader><space> :nohl<cr>

"Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Selects the last pasted text
nnoremap gp `[v`]

" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

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

"panic button
nnoremap <f9> mzggg?G`z

"keeps the cursor in the same place when joining lines
nnoremap J mzJ`z

"split lines
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" disable :X
cmap X<CR> x<CR>

" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" use ctrl-f to open file in current buffer
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -nb '#02151A' -sb '#087891' -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <c-f> :call DmenuOpen("e")<cr>

nnoremap ,cd :cd %:p:h<CR>


"PLUGINS
"""""""""""""""
"Supertab
let g:SuperTabDefaultCompletionType = "context"

"Nerd Commenter
map <C-c> <plug>NERDCommenterToggle

"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"CtrlP
nnoremap <space> :CtrlPMixed<CR>
nnoremap <leader>l :CtrlPLine<CR>
nnoremap <leader>f :CtrlPFunky<CR>
let g:ctrlp_extensions = ['funky']

"Fswitch
nmap <silent> <leader>of :FSHere<cr>
"
"Emmet
let g:user_emmet_leader_key='<C-e>'

"Airline
let g:airline#extensions#tabline#enabled = 1

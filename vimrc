call plug#begin('~/.vim/plugged')

Plug 'BenDoan/tf2syntax.vim', {'for': 'tf2'}
Plug 'bkad/CamelCaseMotion'
Plug 'bling/vim-airline'
Plug 'bruno-/vim-husk'
Plug 'cespare/vim-toml'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-fswitch', {'for': ['c', 'cpp']}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'freeo/vim-kalisi'
Plug 'jimmyhchan/dustjs.vim'
Plug 'JuliaLang/julia-vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja', {'for': 'jinja'}
Plug 'lilydjwg/colorizer'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'motus/pig.vim', {'for': 'pig'}
Plug 'mustache/vim-mustache-handlebars', {'for': ['handlebars', 'handlebars.ember']}
Plug 'osyo-manga/vim-over'
Plug 'posva/vim-vue'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'sirtaj/vim-openscad'
Plug 'sjl/badwolf'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'vim-scripts/mayansmoke'
Plug 'w0rp/ale'
Plug 'zah/nimrod.vim', {'for': 'nim'}
Plug 'dsawardekar/ember.vim', {'for': ['handlebars.ember', 'javascript', 'scss']}
Plug 'dsawardekar/portkey', {'for': ['handlebars.ember', 'javascript', 'scss']}


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
set guioptions-=T  "remove menu bar
set modeline

set modeline "reads modelines, eg: '# vim: set ai tw=75'

set noeb vb t_vb= "Stops screen flashing
au GUIEnter * set vb t_vb=

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
    autocmd BufWritePre *.js Neoformat

    au VimEnter * ColorHighlight

    au WinEnter * setlocal cursorline "only emabled the cursorline in the active window
    au WinLeave * setlocal nocursorline

    au FocusLost * silent! :wa "saves all files when vim loses focus
    au WinLeave * silent! :wa

    "Filetype settings
    au FileType go setlocal noexpandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType vue setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    au FileType kotlin setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

    au BufEnter * let &titlestring = "vim - " . expand("%:p")
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

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

let g:python3_host_prog="/usr/bin/python3"

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

nnoremap ,cd :cd %:p:h<CR>

command Ipythone :normal oimport IPython; IPython.embed()<ESC>

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
"Supertab
let g:SuperTabDefaultCompletionType = "context"

"CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"FZF
nnoremap <space> :FZF<CR>

"Fswitch
nmap <silent> <leader>of :FSHere<cr>

"Emmet
let g:user_emmet_leader_key='<C-e>'

" Vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <BS> :GoTest<CR>

noremap <plug>(slash-after) zz

let g:ale_linters = {
\   'scala': ['scalac'],
\   'java': ['checkstyle'],
\   'python': ['flake8'],
\}

let g:ale_python_mypy_options='--ignore-missing-imports'
let g:ale_python_pylint_options='--disable=invalid-name,missing-docstring'
let g:ale_python_flake8_options='--ignore=E501'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

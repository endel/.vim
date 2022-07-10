set nocompatible              " be iMproved, required
filetype off                  " required

set term=xterm-256color
syntax enable

call plug#begin('~/.vim/plugged')

" essentials
" Plug 'VundleVim/Vundle.vim'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'jlanzarotta/bufexplorer'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'endel/ctrlp-filetype.vim'
Plug 'airblade/vim-rooter'
Plug 'gcmt/taboo.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Utilities
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim' " dependency of 'mattn/gist-vim'
Plug 'mattn/gist-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Writing
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" C/C++
Plug 'vim-scripts/a.vim'

" PHP
" Plug 'tobyS/pdv'

" GameMaker Language
Plug 'nessss/vim-gml'

" Haxe
Plug 'yaymukund/vim-haxe'

" HTML
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'

" JavaScript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'ternjs/tern_for_vim'

" NodeJS
Plug 'sidorares/node-vim-debugger'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Quramy/tsuquyomi'

" Zig
Plug 'ziglang/zig.vim'

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kurkale6ka/vim-pairs'

" Syntax
Plug 'fatih/vim-go'
Plug 'StanAngeloff/php.vim'
Plug 'OrangeT/vim-csharp'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-crystal'
Plug 'elixir-lang/vim-elixir'
Plug 'toyamarinyon/vim-swift'
" > css preprocessors
" Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
" Plug 'tpope/vim-cucumber'
" Plug 'xsbeats/vim-blade'
" Plug 'jdonaldson/vaxe'
Plug 'tobyS/vmustache'
Plug 'cespare/vim-toml'

" Themes
" Plug 'reedes/vim-thematic'
" Plug 'reedes/vim-colors-pencil'
" Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'dracula/vim'
Plug 'eemed/sitruuna.vim'


" Initialize plugin system
call plug#end()

" colorscheme Tomorrow-Night-Bright
colorscheme sitruuna

" Set font accourding to OS
if has('gui_macvim')
  set macligatures
  set linespace=5
elseif has('gui_gtk') || has('gui_gtk2')
  set guifont="Ubuntu Mono":h15
  set linespace=3
elseif has('gui_win32')
  set guifont=Consolas\ for\ Powerline\ FixedD:h13
  set linespace=3
else
  set linespace=3
endif

set guifont=Fira\ Mono:h12

" avoid backup files in working directory
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" backspace on insert mode
set backspace=indent,eol,start

" persistent undo between sessions
set undofile
set undodir=~/.vim/tmp

" style
set number
set autoindent
set smartindent

" Set the terminal's title
set title

" whitespace
set nowrap
set list listchars=tab:▸–,trail:·,nbsp:¬
"eol:¶

set exrc                  " enable per-directory .vimrc files
                          " usually for setting (no)expandtab, shiftwidth, tabstop, etc.

set secure                " disable unsafe commands in local .vimrc files

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden                " Handle multiple buffers better.

set wildmenu              " Enhanced command line completion.
set wildmode=longest,list " Use emacs-style tab completion when selecting files, etc

set autoread              " Reload files changed outside automatically
set history=1000          " Store lots of :cmdline history

set showcmd               " Show incomplete cmds down the bottom
set showmode              " Show current mode down the bottom

set ttimeoutlen=50        " Make Esc work faster
set printoptions=paper:letter
set foldmethod=marker

set laststatus=2          " Always show status line
set nofoldenable          " Folding sucks
set scrolloff=5           " Always shows 5 lines above/below the cursor

"
" Plugin customizations
"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:bufExplorerShowTabBuffer=1           " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1        " BufExplorer: show relative paths
let g:airline_powerline_fonts=1

let g:ctrlp_working_path_mode = 'r'          " CtrlP: use the nearest ancestor that contains one of these directories or file
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }

"
" CtrlP for filetype extension
" https://github.com/endel/ctrlp-filetype.vim
"
let g:ctrlp_extensions = ['filetype']
silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

let g:ag_working_path_mode = 'r'

"
" Authoring
" ---------

let g:snips_author = $USER

" Configure Gist plugin
let g:github_user = $USER
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" PHP Author
let g:pdv_cfg_Author = split(system('git config --global --get user.name'), "\n")[0] . ' <' . split(system('git config --global --get user.email'), "\n")[0]. '>'

" Gui customization
if has('gui_running')
  set lines=42
  set columns=201
endif

"
" Custom key mapping
" ------------------
"
" Leader + Tab: Switching to the previously edited buffer
map <Leader><Tab> :b#<CR>

" Leader + n: New buffer
map <Leader>n :new<CR>

map <D-r> :e<CR>
map <T-r> :e<CR>

" NERDTree
map <Leader>l :NERDTreeToggle<CR>
map <Leader>L :NERDTree<CR>
map <Leader>r :NERDTreeFind<CR><c-w>w
" map <Leader>r :NERDTreeFind<CR>


" Open CtrlP
nnoremap <Leader>t :CtrlP<CR>

" ag.vim
nmap <silent> <Leader>a :Ag

" Open NERDTree
map <Leader>g :Goyo<CR>

" Copy from cursor to the end of the line
nnoremap Y  y$

" Ctrl + S shortcut to save file
nmap <C-s> :w<CR>

" Close current buffer
map <Leader>d :bd<CR>
" Close current buffer without saving
map <Leader>D :bd!<CR>
" Close and save current buffer

" cp = copies the path for current buffer
nmap cp :let @" = expand("%") <CR>

" " (this might screw pair-programming with non-vim users)
" " Force yourself to stop using arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navigate through tabs by number
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<cr>"
noremap <Leader>T :tabnew<cr>"

" copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" highlight
nnoremap <Leader><space> :nohl <CR>

" buffer resizing mappings (shift + arrow key)
nnoremap <Up> <c-w>+
nnoremap <Down> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

" Easy diffget on a 3-way diff
nnoremap dgh :diffget //2 \| diffupdate <CR>
nnoremap dgl :diffget //3 \| diffupdate <CR>

map <Leader>B :if exists(":BufExplorer")<Bar>exe "BufExplorer"<Bar>else<Bar>buffers<Bar>endif<CR>

" Disable middle-click paste (causes too many accidents with crappy mice)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Expand current buffer with Command + Shift + Return
noremap <S-D-CR> :only <CR>
noremap <S-T-CR> :only <CR>

" neoclide/coc.nvim: go-to code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"
" Utility functions
" -----------------
"

" By Endel Dreyer
" Get buffer size in bytes
function! s:BufferByteSize()
  echo printf("%s %s", line2byte(line('$') + 1), "bytes")
endfunction
command! Bytes call s:BufferByteSize()

" remove whitespaces before writing a file
function! <SID>RemoveWhitespaces()
  let l = line(".")
  let c = col(".")
  execute '%s/\s\+$//e'
  call cursor(l, c)
endfunction")"

" Format current JSON buffer
command! JSONFormat :%!python -m json.tool

"
" Opening buffer behaviours
" -------------------------
"

" remember last location when open a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif

" Remove white spaces on write
autocmd BufWritePre * :call <SID>RemoveWhitespaces()

" Git commits: check word spelling
autocmd FileType gitcommit setlocal spell

" Python: Better indentation
autocmd BufNewFile,BufRead *.py setlocal nosmartindent

" Text/Doc files
autocmd FileType text,markdown setlocal linebreak nowrap textwidth=80

" Google protocol buffers
autocmd Bufread,BufNewFile *.proto,*.jslib,*.jsfl set filetype=javascript

" associate *.vue with html filetype
autocmd BufRead,BufNewFile *.vue set filetype=html

" display column to better visualize indentation
autocmd FileType yml set cursorcolumn
autocmd FileType yaml set cursorcolumn
autocmd FileType python set cursorcolumn

" TODO: configure Limelight (missing color config for current colorscheme)
" " Goyo + Limelight (Distraction-free writing)
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!


" TODO:
" TypeScript: use tsconfig.json for linting
" function! TSLint(where)
"     let cfg = findfile('tsconfig.json', escape(a:where, ' ') . ';')
"     return cfg !=# '' ? '-c ' . cfg : ''
" endfunction
"
" autocmd FileType typescript let b:syntastic_typescript_tslint_args = TSLint(expand('<amatch>:p:h', 1))
let g:syntastic_mode_map = { 'passive_filetypes': ['typescript'] }

" TypeScript: set filetype on *.ts files
autocmd BufNewFile,BufRead *.ts set filetype=typescript

" Defold: set filetype of scripts to lua
autocmd BufNewFile,BufRead *.script set filetype=lua
autocmd BufNewFile,BufRead *.gui_script set filetype=lua

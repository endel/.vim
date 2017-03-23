set nocompatible              " be iMproved, required
filetype off                  " required

set term=xterm-256color
syntax enable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" essentials
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'endel/ctrlp-filetype.vim'
Plugin 'airblade/vim-rooter'
Plugin 'gcmt/taboo.vim'
Plugin 'Shougo/vimproc.vim'

" Utilities
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'mattn/webapi-vim' " dependency of 'mattn/gist-vim'
Plugin 'mattn/gist-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'metakirby5/codi.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

" C/C++
Plugin 'vim-scripts/a.vim'

" PHP
" Plugin 'tobyS/pdv'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/MatchTagAlways'

" JavaScript
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'ternjs/tern_for_vim'

" TypeScript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'

" Editing
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kurkale6ka/vim-pairs'

" Syntax
Plugin 'fatih/vim-go'
Plugin 'StanAngeloff/php.vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'rust-lang/rust.vim'
Plugin 'rhysd/vim-crystal'
Plugin 'elixir-lang/vim-elixir'
Plugin 'toyamarinyon/vim-swift'
" > css preprocessors
" Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
" Plugin 'tpope/vim-cucumber'
" Plugin 'xsbeats/vim-blade'
" Plugin 'jdonaldson/vaxe'
Plugin 'tobyS/vmustache'

" Themes
Plugin 'reedes/vim-thematic'
Plugin 'reedes/vim-colors-pencil'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme Tomorrow-Night-Bright

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

set diffopt+=vertical     " Use vertical view for :Gdiff

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
map <Leader>u :GundoToggle<CR>

" Leader + Tab: Switching to the previously edited buffer
map <Leader><Tab> :b#<CR>

" Leader + n: New buffer
map <Leader>n :new<CR>

map <D-r> :e<CR>
map <T-r> :e<CR>

" Toggle NERDTree
map <Leader>l :NERDTreeToggle<CR>

" Open NERDTree
map <Leader>L :NERDTree<CR>

" Open CtrlP
nnoremap <Leader>t :CtrlP<CR>

" ag.vim
nmap <silent> <Leader>a :Ag

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

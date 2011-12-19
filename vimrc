" Setup pathogen.vim to autoload bundled plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
"runtime bundle/vim-repeat/autoload/repeat.vim

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

" load all bundles
call pathogen#infect()
call pathogen#helptags()

" colors
syntax on

set guifont=Monaco:h14
set background=dark
colorscheme vividchalk

" custom configuration
set history=1000 "store lots of :cmdline history
set showcmd      "show incomplete cmds down the bottom
set showmode     "show current mode down the bottom

" style
set number
set autoindent

" whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"
" Custom key mapping
" ------------------
"
" Leader + Tab: Switching to the previously edited buffer
map <Leader><Tab> :b#<CR>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Open .vimrc for quick-edit.
nmap <Leader>v :tabedit $MYVIMRC<CR>

if has("autocmd")
  " remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Auto-reload VIM configuration when .vimrc is changed
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ruby
au BufRead,BufNewFile {Gemfile,Rakefile,config.ru} set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

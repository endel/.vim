" Setup pathogen.vim to autoload bundled plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

"load ftplugins and indent files
filetype plugin on
filetype indent on

" load all bundles
call pathogen#infect()
call pathogen#helptags()

" colors
syntax enable

set guifont=Monaco:h14
set background=light
"set background=dark

"colorscheme jellybeans
colorscheme solarized
"colorscheme github
"colorscheme vividchalk

" hide toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" style
set number
set autoindent

" Highlight the current line
set cursorline

" Set the terminal's title
set title

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
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

" Plugin customizations

let g:bufExplorerShowRelativePath=1

" NERDTree
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1

" Snipmate:
" TODO: WTF how can I customize this?
"let g:snipMate['scope_aliases'] = {'objc' :'c'
    "\ ,'cpp': 'c'
    "\ ,'cs':'c'
    "\ ,'xhtml': 'html'
    "\ ,'html': 'javascript'
    "\ ,'php': 'php,html,javascript'
    "\ ,'ur': 'html,javascript'
    "\ ,'mxml': 'actionscript'
    "\ ,'eruby': 'eruby,eruby-rails,html'
    "\ }


" Change root directory on buffer enter
autocmd BufEnter * :Rooter

if exists('+undofile')
  set undofile
endif
if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif

if has("eval")
  " custom configuration for surround.vim
  let g:surround_{char2nr('-')} = "<% \r %>"
  let g:surround_{char2nr('=')} = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_{char2nr('^')} = "/^\r$/"
  let g:surround_indent = 1

  " used for statusline
  function! SL(function)
    if exists('*'.a:function)
      return call(a:function,[])
    else
      return ''
    endif
  endfunction

  " Mapped to F9
  function! Run()
    let old_makeprg = &makeprg
    let old_errorformat = &errorformat
    try
      let cmd = matchstr(getline(1),'^#!\zs[^ ]*')
      if exists('b:run_command')
        exe b:run_command
      elseif cmd != '' && executable(cmd)
        wa
        let &makeprg = matchstr(getline(1),'^#!\zs.*').' %'
        make
      elseif &ft == 'mail' || &ft == 'text' || &ft == 'help' || &ft == 'gitcommit'
        setlocal spell!
      elseif exists('b:rails_root') && exists(':Rake')
        wa
        Rake
      elseif &ft == 'cucumber'
        wa
        compiler cucumber
        make %
      elseif &ft == 'ruby'
        wa
        if executable(expand('%:p')) || getline(1) =~ '^#!'
          compiler ruby
          let &makeprg = 'ruby'
          make %
        elseif expand('%:t') =~ '_test\.rb$'
          compiler rubyunit
          let &makeprg = 'ruby'
          make %
        elseif expand('%:t') =~ '_spec\.rb$'
          compiler rspec
          let &makeprg = 'rspec'
          make %
        elseif &makeprg ==# 'bundle'
          make
        elseif executable('pry') && exists('b:rake_root')
          execute '!pry -I"'.b:rake_root.'/lib" -r"%:p"'
        elseif executable('pry')
          !pry -r"%:p"
        else
          !irb -r"%:p"
        endif
      elseif &ft == 'html' || &ft == 'xhtml' || &ft == 'php' || &ft == 'aspvbs' || &ft == 'aspperl'
        wa
        if !exists('b:url')
          call OpenURL(expand('%:p'))
        else
          call OpenURL(b:url)
        endif
      elseif &ft == 'vim'
        w
        unlet! g:loaded_{expand('%:t:r')}
        return 'source %'
      elseif &ft == 'sql'
        1,$DBExecRangeSQL
      elseif expand('%:e') == 'tex'
        wa
        exe "normal :!rubber -f %:r && xdvi %:r >/dev/null 2>/dev/null &\<CR>"
      elseif &ft == 'dot'
        let &makeprg = 'dotty'
        make %
      else
        wa
        if &makeprg =~ '%'
          make
        else
          make %
        endif
      endif
      return ''
    finally
      let &makeprg = old_makeprg
      let &errorformat = old_errorformat
    endtry
  endfunction
  command! -bar Run :execute Run()

endif

"
" Custom key mapping
" ------------------
"

" Leader + Tab: Switching to the previously edited buffer
map <Leader><Tab> :b#<CR>

" Leader + n: New buffer
map <Leader>n :new<CR>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"key mapping for saving file
nmap <C-s> :w<CR>

" Toggle NERDTree
map <Leader>l :NERDTreeToggle<CR>
" Open NERDTree
map <Leader>L :NERDTree<CR>

" ack.vim
nmap <silent> <unique> <Leader>a :Ack
nmap <silent> <unique> <Leader>as :AckFromSearch
nmap <silent> <unique> <Leader>af :AckFile

" Copy from cursor to the end of the line
nnoremap Y  y$

" Close current buffer
map <Leader>d :bd<CR>
" Close current buffer without saving
map <Leader>D :bd!<CR>
" Close and save current buffer
map <Leader>W :w \| bd<CR>

" Force yourself to stop using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Utilty
map  <F1>   <Esc>
map! <F1>   <Esc>
"map <F3>    :cnext<CR>
"map <F4>    :cc<CR>
"map <F5>    :cprev<CR>
nmap <silent> <F6> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>
nmap <silent> <F7> :if exists(':Glcd')<Bar>exe 'Glcd'<Bar>elseif exists(':Rlcd')<Bar>exe 'Rlcd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
map <F8>    :wa<Bar>make<CR>
map <F9>    :Run<CR>
map <silent> <F10>   :let tagsfile = tempname()\|silent exe "!ctags -f ".tagsfile." \"%\""\|let &l:tags .= "," . tagsfile\|unlet tagsfile<CR>
map <silent> <F11> :if exists(":BufExplorer")<Bar>exe "BufExplorer"<Bar>else<Bar>buffers<Bar>endif<CR>

" Disable middle-click paste (causes too many accidents with crappy mice)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" Before / next buffer navigation using ctrl + p / ctrl + n
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>

" Expand current buffer with Command + Shift + Return
noremap <S-D-CR> :only <CR>

" Hide search highlight
if exists(":nohls")
  nmap <silent> ,/ :nohls<CR>
endif

" Open .vimrc for quick-edit.
map <Leader>v  :source $MYVIMRC<CR>

if has("autocmd")
  " remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Auto-reload VIM configuration when .vimrc is changed
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

"
" Identation by filetype
" 

"
" ActionScript:
" Make spacing compatible with most IDE's default configuration
"
autocmd FileType actionscript setlocal tabstop=4
autocmd FileType actionscript setlocal shiftwidth=4
autocmd FileType actionscript setlocal softtabstop=4
autocmd FileType actionscript setlocal expandtab

" Setup pathogen.vim to autoload bundled plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

" No compatible with vi. Who cares about vi?
set encoding=utf8
set nocompatible

"load ftplugins and indent files
filetype plugin on
filetype indent on

" load all bundles
set nocp
call pathogen#infect()
call pathogen#helptags()

" colors and style
syntax enable

" thematic configuration
let g:thematic#defaults = {
      \ 'typeface': 'Meslo LG L DZ for Powerline',
      \ 'colorscheme': 'Tomorrow-Night-Bright',
      \ 'airline-theme': 'jellybeans',
      \ 'background': 'dark',
      \ 'font-size': 12,
      \ 'laststatus': 2,
      \ }

let g:thematic#themes = {
      \ 'Tomorrow-Night-Bright' : {},
      \ 'jellybeans' : {},
      \ 'solar_dark' : { 'colorscheme': 'solarized',
      \                  'diff-color-fix': 1,
      \                  'sign-column-color-fix': 1,
      \                },
      \ 'solar_lite' : { 'colorscheme': 'solarized',
      \                  'background': 'light',
      \                  'sign-column-color-fix': 1,
      \                },
      \ 'github'     : { 'background': 'light' },
      \ 'pencil'     : { 'colorscheme': 'pencil',
      \                  'background': 'light',
      \                  'font-size': 20,
      \                  'linespace': 8,
      \                  'typeface': 'Cousine',
      \                },
      \ 'iawriter'   : { 'colorscheme': 'pencil',
      \                  'background': 'light',
      \                  'columns': 75,
      \                  'font-size': 20,
      \                  'fullscreen': 1,
      \                  'laststatus': 0,
      \                  'linespace': 8,
      \                  'typeface': 'Cousine',
      \                },
      \ }

colorscheme Tomorrow-Night-Bright

" Set font accourding to OS
if has('gui_macvim')
  set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
  set linespace=5
elseif has('gui_gtk') || has('gui_gtk2')
  set guifont="Ubuntu Mono":h15
  set linespace=3
elseif has('gui_win32')
  set guifont=Consolas\ for\ Powerline\ FixedD:h13
  set linespace=3
else
  set guifont=Iconsolata-dz\ for\ Powerline:h15
  set linespace=3
endif

" centralized backup directory
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" style
set number
set autoindent

" Set the terminal's title
set title

" whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
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

" Use different colorscheme when are using GUI or console
if has("gui_running")
  " Highlight the current line
  set cursorline

  " hide toolbar
  set guioptions=egmrt
endif

"
" Plugin customizations
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:bufExplorerShowTabBuffer=1           " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1        " BufExplorer: show relative paths
let g:airline_powerline_fonts=1

let g:ctrlp_map = '<\-t>'
let g:ctrlp_working_path_mode = 2          " CtrlP: use the nearest ancestor that contains one of these directories or files: .git/ .hg/ .svn/ .bzr/ _darcs/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip   " MacOSX/Linux
" set wildignore+=tmp\*,*.swp,*.zip,*.exe    " Windows
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.DS_Store',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_extensions = [
   \ 'ctrlp-filetpe',
   \ ]
let g:ctrlp_follow_symlinks = 1

" win32 fullscreen
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" Rooter patterns for identifying root path
let g:rooter_patterns = ['tags', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']

" Gundo
let g:gundo_right = 1
let g:gundo_help = 0

" Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_quiet_messages = { "type": "style" }

" NERDTree
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1

" CtrlP familiar to Command-T
silent! nnoremap <unique> <silent> <Leader>t :CtrlP<CR>

" CtrlP for buffers
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>

" CtrlP for tags
silent! nnoremap <unique> <silent> <Leader>T :CtrlPTag<CR>

" CtrlP for filetype
silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

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

" Open tags in a new tab
nmap <C-Enter> <C-w><C-]><C-w>T

" Easy diffget on a 3-way diff
nnoremap dgh :diffget //2 \| diffupdate <CR>
nnoremap dgl :diffget //3 \| diffupdate <CR>

" Change root directory on buffer enter
autocmd BufEnter * :Rooter

if exists('+undofile')
  set undofile
endif
if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif

" Return a command output for a vimscript
" extracted from lh-vim: http://code.google.com/p/lh-vim/source/browse/vim-lib/trunk/autoload/lh/askvim.vim#57
function! Askvim_exe(command)
  let save_a = @a
  try
    silent! redir @a
    silent! exe a:command
    redir END
  finally
    " Always restore everything
    let res = @a
    let @a = save_a
    return res
  endtry
endfunction

" By Tim Pope
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" mapping to open URL under cursor
nnoremap gb :OpenURL <cfile><CR>
nnoremap gA :OpenURL http://www.answers.com/<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

" By Endel Dreyer
" Write COMMIT_EDITMSG and push to current branch
function! PushToCurrentBranch()
  exe ":Gwrite"
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  exe ":Git push origin" . branch
endfunction

" mapping to write commit and push to current branch
nnoremap gwp :call PushToCurrentBranch()<CR>

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
endfunction

" mapping to remove whitespaces
nnoremap <silent> <S-Space> :call <SID>RemoveWhitespaces()<CR>

" remove whitespaces before writing a file
function! <SID>FixLineEndings()
  let l = line(".")
  let c = col(".")
  execute "%s///g"
  call <SID>RemoveWhitespaces()
  call cursor(l, c)
endfunction

" mapping to remove whitespaces
nnoremap <silent> <S-L> :call <SID>FixLineEndings()<CR>

" mapping to generate tags file
function! FlushEnvironment()
  silent! exe ":!ctags -R"
endfunction
silent! nnoremap <silent> TT :call FlushEnvironment()<CR>

" custom configuration for surround.vim
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

" Mapped to F9
function! Run()
  let old_makeprg = &makeprg
  let old_errorformat = &errorformat
  try
    if &ft == 'javascript'
      compiler jsc
      make %
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

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
nmap <T-[> <<
nmap <T-]> >>
vmap <T-[> <gv
vmap <T-]> >gv

" Ctrl + S shortcut to save file
nmap <C-s> :w<CR>

" Toggle NERDTree
map <Leader>l :NERDTreeToggle<CR>
" Open NERDTree
map <Leader>L :NERDTree<CR>

" ag.vim
nmap <silent> <unique> <Leader>a :Ag

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
map <silent> <Leader>s :Gstatus<CR>

"map <F3>    :cnext<CR>
"map <F4>    :cc<CR>
"map <F5>    :cprev<CR>
nmap <silent> <F7> :if exists(':Glcd')<Bar>exe 'Glcd'<Bar>elseif exists(':Rlcd')<Bar>exe 'Rlcd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
map <F8>    :wa<Bar>make<CR>
map <F9>    :Run<CR>
map <silent> <F10>   :let tagsfile = tempname()\|silent exe "!ctags -f ".tagsfile." \"%\""\|let &l:tags .= "," . tagsfile\|unlet tagsfile<CR>
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

" Before / next buffer navigation using ctrl + p / ctrl + n
map <C-p> :bprev<CR>
map <C-n> :bnext<CR>

" Expand current buffer with Command + Shift + Return
noremap <S-D-CR> :only <CR>
noremap <S-T-CR> :only <CR>

set pastetoggle=<F2>

" Hide search highlight
if exists(":nohls")
  map <silent><Leader>, :nohls<CR>
endif

" Open .vimrc for quick-edit.
map <Leader>ev :edit $MYVIMRC<CR>
map <Leader>v :source $MYVIMRC<CR>

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
autocmd Bufread,BufNewFile *.proto set filetype=javascript

" Ruby
" - Allow to browse through gem ctags
"autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      "\ pathogen#split(&tags) +
      "\ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

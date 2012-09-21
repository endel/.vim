" Setup pathogen.vim to autoload bundled plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

" No compatible with vi. Who cares about vi?
set nocompatible

"load ftplugins and indent files
filetype plugin on
filetype indent on

" load all bundles
call pathogen#infect()
call pathogen#helptags()

" colors and style
syntax enable

" Set font accourding to OS
if has('gui_macvim')
  set guifont=Menlo:h13
elseif has('gui_gtk') || has('gui_gtk2')
  set guifont="Ubuntu Mono":h15
elseif has('gui_win32')
  set guifont="Consolas":h15
else
  set guifont="Courier New":h15
endif
set linespace=3

"set background=light
set background=dark
colorscheme Tomorrow-Night-Bright
"colorscheme solarized
"colorscheme github
"colorscheme vividchalk

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
" let g:snips_trigger_key = '<c-space>'      " SnipMate: remap to Ctrl + Space
let g:bufExplorerShowTabBuffer=1           " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1        " BufExplorer: show relative paths
let g:Powerline_symbols='fancy'            " Powerline: fancy statusline (patched font)

let g:ctrlp_working_path_mode = 2          " CtrlP: use the nearest ancestor that contains one of these directories or files: .git/ .hg/ .svn/ .bzr/ _darcs/
set wildignore+=*/tmp/*,*.so,*.swp,*.zip   " MacOSX/Linux
" set wildignore+=tmp\*,*.swp,*.zip,*.exe    " Windows
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_extensions = [
   \ 'ctrlp-filetpe',
   \ ]
let g:ctrlp_follow_symlinks = 1

" Rooter patterns for identifying root path
let g:rooter_patterns = ['tags', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']

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

" Add '|' text objects
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Add '/' text objects
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,

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

" remove whitespaces before writing a file
function! <SID>RemoveWhitespaces()
  let l = line(".")
  let c = col(".")
  execute '%s/\s\+$//e'
  call cursor(l, c)
endfunction

" mapping to remove whitespaces
nnoremap <silent> <S-Space> :call <SID>RemoveWhitespaces()<CR>

" mapping to generate tags file
function! FlushEnvironment()
  silent! exe ":!ctags -R"
endfunction
silent! nnoremap <silent> TT :call FlushEnvironment()<CR>

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

map <D-r> :e<CR>

"Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Ctrl + S shortcut to save file
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

" Hide search highlight
if exists(":nohls")
  map <silent><Leader>, :nohls<CR>
endif

" Open .vimrc for quick-edit.
map <Leader>ev :edit $MYVIMRC<CR>
map <Leader>v :source $MYVIMRC<CR>

" remember last location when open a file
"
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif

autocmd BufWritePre * :call <SID>RemoveWhitespaces()

"
" Ruby
" - Allow to browser through gem ctags
"
"autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      "\ pathogen#split(&tags) +
      "\ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

"
" JavaScript:
" - Indentation compatible with default JSLint config: http://www.jslint.com/
"
autocmd FileType javascript setlocal tabstop=4
autocmd FileType javascript setlocal shiftwidth=4
autocmd FileType javascript setlocal softtabstop=4

"
" Python: Better indentation
"
autocmd BufNewFile,BufRead *.py setlocal nosmartindent

"
" Google protocol buffers
"
autocmd Bufread,BufNewFile *.proto set filetype=javascript

" TagList plugin configuration
" let tlist_tex_settings          = 'latex;s:sections;g:graphics;l:labels'
" let tlist_make_settings         = 'make;m:makros;t:targets'

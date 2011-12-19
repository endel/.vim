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
set autoread        " Reload files changed outside automatically
set laststatus=2    " Always show status line"
set modelines=5     " Debian likes to disable this
set history=1000    " Store lots of :cmdline history
set showcmd         " Show incomplete cmds down the bottom
set showmode        " Show current mode down the bottom
set ttimeoutlen=50  " Make Esc work faster"
set printoptions=paper:letter
set foldmethod=marker
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P


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

" Copy from cursor to the end of the line
nnoremap Y  y$

map  <F1>   <Esc>
map! <F1>   <Esc>
map <F3>    :cnext<CR>
map <F4>    :cc<CR>
map <F5>    :cprev<CR>
nmap <silent> <F6> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>
nmap <silent> <F7> :if exists(':Glcd')<Bar>exe 'Glcd'<Bar>elseif exists(':Rlcd')<Bar>exe 'Rlcd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
map <F8>    :wa<Bar>make<CR>
map <F9>    :Run<CR>
map <silent> <F10>   :let tagsfile = tempname()\|silent exe "!ctags -f ".tagsfile." \"%\""\|let &l:tags .= "," . tagsfile\|unlet tagsfile<CR>
map <silent> <F11> :if exists(":BufExplorer")<Bar>exe "BufExplorer"<Bar>else<Bar>buffers<Bar>endif<CR>
map <S-F4>  :bdelete<CR>

noremap  <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
endif

" Open .vimrc for quick-edit.
map <Leader>v  :so ~/.vimrc<CR>

if has("autocmd")
  " remember last location in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  " Auto-reload VIM configuration when .vimrc is changed
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" ruby
au BufRead,BufNewFile {Gemfile,Rakefile,config.ru} set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

endel/.vim
---

My awesome VIM configuration. Tested only on MacVim.


Plugins Setup
---

First of all, you need to init and update all bundle submodules.

    $ git submodule update --init


Plugins flagged with * needs attention to setup, just follow what README file of the plugin, skiping the vim installation steps.
It's recommended to you to read how to use each of the listed plugins below.

 * [* ack](https://github.com/mileszs/ack.vim.git)
 * [* Command-T](https://github.com/wincent/Command-T)
 * [* gist-vim](https://github.com/mattn/gist-vim.git)
 * [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
 * [javascript](https://github.com/pangloss/vim-javascript.git)
 * [vim-pathogen](https://github.com/tpope/vim-pathogen.git)
 * [vim-repeat](https://github.com/tpope/vim-repeat.git)
 * [vim-bundler](https://github.com/tpope/vim-bundler.git)
 * [vim-matchit](https://github.com/tsaleh/vim-matchit.git)
 * [nerdtree](https://github.com/scrooloose/nerdtree.git)
 * [actionscript](https://github.com/endel/actionscript.vim)
 * [vim-surround.git](https://github.com/tpope/vim-surround.git)
 * [vim-markdown](https://github.com/tpope/vim-markdown.git)
 * [vim-php](https://github.com/madflow/vim-php.git)
 * [vim-rails](https://github.com/tpope/vim-rails.git)
 * [vim-ruby](https://github.com/vim-ruby/vim-ruby.git)
 * [vim-endwise](https://github.com/tpope/vim-endwise.git)
 * [vim-less](https://github.com/groenewege/vim-less.git)
 * [vim-supertab](https://github.com/tsaleh/vim-supertab.git)
 * [vim-haml](https://github.com/tpope/vim-haml.git)
 * [vim-cucumber](https://github.com/tpope/vim-cucumber.git)
 * [delimitMate](https://github.com/Raimondi/delimitMate/)
 * [vim-git](https://github.com/tpope/vim-git)
 * [bufexplorer](https://github.com/corntrace/bufexplorer.git)
 * [vim-snipmate](https://github.com/garbas/vim-snipmate.git)
 * [vim-rooter](https://github.com/airblade/vim-rooter.git)
 * [snipmate-snippets](https://github.com/honza/snipmate-snippets.git)
 * [vim-commentary](https://github.com/tpope/vim-commentary)
 * [nerdcommenter](https://github.com/scrooloose/nerdcommenter.git)

Just utility functions, used in some plugins.

 * [tlib](https://github.com/tomtom/tlib_vim.git)
 * [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git)

Gist plugin configuration

" Configure Gist plugin

  let g:github_user = 'GITHUB_USERNAME'
  let g:github_token = 'GITHUB_TOKEN'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1


Custom key mapping
---

Miscellaneous:

 * __;__: Enter cmdline mode. (same as : - avoid pressing and releasing shift)
 * __Y__: Yank all characters after current cursor position (y$)
 * __,/__: Hide search highlight (:nohl)
 * __Leader + v__: Reload VIM configuration (:source $MYVIMRC)


Buffers:

 * __Command + Shift + Enter__: Expand current buffer (:only)
 * __Ctrl + n__: Go to next buffer (:bnext)
 * __Ctrl + p__: Go to previous buffer (:bprev)
 * __Leader + Tab__: Swap to last edited buffer (same as ctrl + 6 or :b#)
 * __Leader + b__: Close current buffer (:bd)
 * __Leader + D__: Close current buffer without saving (:bd!)
 * __Leader + W__: Close current buffer and save (:w | bd)
 * __Leader + n__: New buffer (:new)

Plugins:

 * __Leader + l__: Toggle NERDTree (:NERDTreeToggle)
 * __Leader + L__: Open new NERDTree buffer (:NERDTree)
 * __Leader + a__: Run :Ack [pattern]
 * __Leader + as__: Run :AckFromSearch [pattern]
 * __Leader + af__: Run :AckFile [pattern]
 * __Leader + B__: Open Buffer Explorer (:BufExplorer)
 * __F6__: Open git status interface (:Gstatus)

Indentation:

  * __Command + [__: Indent current line/selection leftwards
  * __Command + ]__: Indent current line/selection rightwards


Colorschemes
---

Awesome colorscheme flavors

 * [solarized] (https://github.com/altercation/vim-colors-solarized)
 * [jellybeans](https://github.com/nanotech/jellybeans.vim)
 * [vividchalk] (https://github.com/tpope/vim-vividc)
 * [github] (https://github.com/endel/vim-github-colorscheme)


Inspiration
---

Inspired by [tpope](https://github.com/tpope), [airblade](https://github.com/airblade) and [garybernhardt](https://github.com/garybernhardt)

endel/.vim
---

My awesome VIM configuration. Tested only on MacVim.


Plugins Setup
---

First of all, you need to init and update all bundle submodules.

    $ git submodule update --init


Plugins flagged with * needs attention to setup, just follow what README file of the plugin, skiping the vim installation steps.
It's recommended to you to read how to use each of the listed plugins below.

 * [* ack](https://github.com/mileszs/ack.vim)
 * [* Command-T](https://github.com/wincent/Command-T)
 * [* gist-vim](https://github.com/mattn/gist-vim)
 * [* vim-powerline](https://github.com/Lokaltog/vim-powerline) - you can install the patched *Iconsolata* font at <code>utils</code> directory.
 * [vim-fugitive](https://github.com/tpope/vim-fugitive)
 * [javascript](https://github.com/pangloss/vim-javascript)
 * [vim-pathogen](https://github.com/tpope/vim-pathogen)
 * [vim-repeat](https://github.com/tpope/vim-repeat)
 * [vim-bundler](https://github.com/tpope/vim-bundler)
 * [vim-matchit](https://github.com/tsaleh/vim-matchit)
 * [nerdtree](https://github.com/scrooloose/nerdtree)
 * [actionscript](https://github.com/endel/actionscript.vim)
 * [vim-surround](https://github.com/tpope/vim-surround)
 * [vim-markdown](https://github.com/tpope/vim-markdown)
 * [vim-php](https://github.com/madflow/vim-php)
 * [vim-rails](https://github.com/tpope/vim-rails)
 * [vim-ruby](https://github.com/vim-ruby/vim-ruby)
 * [vim-endwise](https://github.com/tpope/vim-endwise)
 * [vim-less](https://github.com/groenewege/vim-less)
 * [vim-haml](https://github.com/tpope/vim-haml)
 * [vim-cucumber](https://github.com/tpope/vim-cucumber)
 * [delimitMate](https://github.com/Raimondi/delimitMate/)
 * [vim-git](https://github.com/tpope/vim-git)
 * [bufexplorer](https://github.com/corntrace/bufexplorer)
 * [vim-snipmate](https://github.com/garbas/vim-snipmate)
 * [vim-rooter](https://github.com/airblade/vim-rooter)
 * [snipmate-snippets](https://github.com/honza/snipmate-snippets)
 * [vim-commentary](https://github.com/tpope/vim-commentary)
 * [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

Utility functions, used as helper for some plugins.

 * [tlib](https://github.com/tomtom/tlib_vim)
 * [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)


Custom key mapping
---

Miscellaneous:

 * __;__ - Enter cmdline mode. (same as : - avoid pressing and releasing shift)
 * __Y__ - Yank all characters after current cursor position (y$)
 * __,/__ - Hide search highlight (:nohl)
 * __Leader + ev__ - Open user ~/.vimrc file (:edit $MYVIMRC)
 * __Leader + v__ - Reload VIM configuration (:source $MYVIMRC)


Buffers:

 * __Command + Shift + Enter__ - Expand current buffer (:only)
 * __Ctrl + n__ - Go to next buffer (:bnext)
 * __Ctrl + p__ - Go to previous buffer (:bprev)
 * __Leader + Tab__ - Swap to last edited buffer (same as ctrl + 6 or :b#)
 * __Leader + b__ - Close current buffer (:bd)
 * __Leader + D__ - Close current buffer without saving (:bd!)
 * __Leader + W__ - Close current buffer and save (:w | bd)
 * __Leader + n__ - New buffer (:new)

Plugins:

 * __Leader + l__ - Toggle NERDTree (:NERDTreeToggle)
 * __Leader + L__ - Open new NERDTree buffer (:NERDTree)
 * __Leader + a__ - Run :Ack [pattern]
 * __Leader + as__ - Run :AckFromSearch [pattern]
 * __Leader + af__ - Run :AckFile [pattern]
 * __Leader + B__ - Open Buffer Explorer (:BufExplorer)
 * __F6__ - Open git status interface (:Gstatus)

Indentation:

  * __Command + [__ - Indent current line/selection leftwards
  * __Command + ]__ - Indent current line/selection rightwards


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

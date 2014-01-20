endel/vimfiles
---

My awesome VIM configuration.

Usage pattern
---

On MacVim, use each tab as a isolated project.
[vim-rooter](https://github.com/airblade/vim-rooter) plugin will take care of
you project's root path, and all the others plugins will follow it, such as
[ctrlp](https://github.com/kien/ctrlp.vim),
[nerdtree](https://github.com/scrooloose/nerdtree),
[bufexplorer](https://github.com/jlanzarotta/bufexplorer), etc.


Plugins Setup
---

First of all, you need to init and update all bundle submodules.

    $ git submodule update --init


Plugins flagged with * needs attention to setup, just follow what README file of the plugin, skiping the vim installation steps.
It's recommended to you to read how to use each of the listed plugins below.

 * [* ag](https://github.com/rking/ag.vim)
 * [* gist-vim](https://github.com/mattn/gist-vim)
 * [* vim-airline](https://github.com/bling/vim-airline) - you can install the patched *Iconsolata* font at <code>support</code> directory.
 * [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
 * [ctrlp](https://github.com/kien/ctrlp.vim)
 * [ctrlp-filetype](https://github.com/endel/ctrlp-filetype.vim)
 * [vim-fugitive](https://github.com/tpope/vim-fugitive)
 * [syntastic](https://github.com/scrooloose/syntastic)
 * [vim-pathogen](https://github.com/tpope/vim-pathogen)
 * [vim-repeat](https://github.com/tpope/vim-repeat)
 * [vim-matchit](https://github.com/tsaleh/vim-matchit)
 * [nerdtree](https://github.com/scrooloose/nerdtree)
 * [vim-surround](https://github.com/tpope/vim-surround)
 * [vim-endwise](https://github.com/tpope/vim-endwise)
 * [auto-pairs](https://github.com/jiangmiao/auto-pairs)
 * [vim-git](https://github.com/tpope/vim-git)
 * [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
 * [vim-rooter](https://github.com/airblade/vim-rooter)
 * [ultisnips](https://github.com/SirVer/ultisnips)
 * [vim-snippets](https://github.com/honza/vim-snippets)
 * [tcomment](https://github.com/tomtom/tcomment_vim)
 * [gundo](https://github.com/sjl/gundo.vim.git)
 * [AutoTag](https://github.com/vim-scripts/AutoTag)
 * [a](https://github.com/vim-scripts/a.vim)
 * [vim-pairs](https://github.com/kurkale6ka/vim-pairs)

Syntax / Indent:

 * [ruby](https://github.com/vim-ruby/vim-ruby)
 * [rails](https://github.com/tpope/vim-rails)
 * [less](https://github.com/groenewege/vim-less)
 * [haml](https://github.com/tpope/vim-haml)
 * [cucumber](https://github.com/tpope/vim-cucumber)
 * [markdown](https://github.com/tpope/vim-markdown)
 * [php](https://github.com/madflow/vim-php)
 * [javascript](https://github.com/pangloss/vim-javascript)
 * [coffees-cript](https://github.com/kchmck/vim-coffee-script)
 * [stylus](https://github.com/wavded/vim-stylus)
 * [mustache/handlebars](https://github.com/mustache/vim-mode)
 * [blade](https://github.com/xsbeats/vim-blade)

Utility plugins, required for some plugins.

 * [tlib](https://github.com/tomtom/tlib_vim)
 * [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)


Custom key mapping
---

Miscellaneous:

 * __Y__ - Yank all characters after current cursor position (y$)
 * __TT__ - Generate project tags file
 * __Leader + ,__ - Hide search highlight (:nohl)
 * __Leader + ev__ - Open user ~/.vimrc file (:edit $MYVIMRC)
 * __Leader + v__ - Reload VIM configuration (:source $MYVIMRC)
 * __Shift + Space__ - Remove trailing whitespaces.
 * :Bytes - Get the number of bytes of this buffer. It doesn't need to be saved.

Git / Commiting:

 * __Leader + s__ - Open git status interface (:Gstatus)
 * __gwp__ - Write commit file and push to current branch (:Gwrite | Git push origin [currentbranch])

Diff:

 * __dgh__ - Get diff from left buffer (:diffget //2 | diffupdate)
 * __dgl__ - Get diff from right buffer (:diffget //3 | diffupdate)

Buffers:

 * __Command + Shift + Enter__ - Expand current buffer (:only)
 * __Ctrl + n__ - Go to next buffer (:bnext)
 * __Ctrl + p__ - Go to previous buffer (:bprev)
 * __Leader + Tab__ - Swap to last edited buffer (:b#)
 * __Leader + d__ - Close current buffer (:bd)
 * __Leader + D__ - Close current buffer without saving (:bd!)
 * __Leader + W__ - Close current buffer and save (:w | bd)
 * __Leader + n__ - New buffer (:new)

Plugins:

 * __Leader + t__ - Open ctrl-p for files (:CtrlP)
 * __Leader + T__ - Open ctrl-p for tags (:CtrlPTag)
 * __Leader + f__ - Open ctrl-p for tags (:CtrlPFiletype)
 * __Leader + b__ - Open ctrl-p for buffers (:CtrlPBuffer)
 * __Leader + l__ - Toggle NERDTree (:NERDTreeToggle)
 * __Leader + L__ - Open new NERDTree buffer (:NERDTree)
 * __Leader + a__ - Run :Ag [pattern]
 * __Leader + B__ - Open Buffer Explorer (:BufExplorer)

Indentation:

  * __Command + [__ - Indent current line/selection leftwards
  * __Command + ]__ - Indent current line/selection rightwards


Colorschemes
---

Awesome colorscheme flavors

 * [thematic] (https://github.com/reedes/vim-thematic.git): Theme manager
 * [tomorrow] (https://github.com/chriskempson/vim-tomorrow-theme)
 * [solarized] (https://github.com/altercation/vim-colors-solarized)
 * [jellybeans](https://github.com/nanotech/jellybeans.vim)
 * [vividchalk] (https://github.com/tpope/vim-vividc)
 * [pencil] (https://github.com/reedes/vim-colors-pencil.git)
 * [github] (https://github.com/endel/vim-github-colorscheme)


Inspiration
---

Inspired by [tpope](https://github.com/tpope), [airblade](https://github.com/airblade) and [garybernhardt](https://github.com/garybernhardt)

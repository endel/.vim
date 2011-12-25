endel/.vim
---

My awesome VIM configuration. Tested only on MacVim.

Plugins Setup
---

Rooter 


Key mappings
---

Miscellaneous:

 * __Y__: Yank all characters after current cursor position (y$)
 * __,/__: Hide search highlight (:nohl)
 * __Leader + v__: Reload VIM configuration (:source $MYVIMRC)


Buffers:

 * __Command + Shift + Enter__: Expand current buffer (:only)
 * __Leader + Tab__: Swap to last edited buffer (same as ctrl + 6 or :b#)
 * __Leader + n__: Go to next buffer (:bnext)
 * __Leader + p__: Go to previous buffer (:bprev)
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
 * __F6__: Open git status interface (:Gstatus)
 * __F11__: Open Buffer Explorer (:BufExplorer)

Indentation:

  * __Command + [__: Indent current line/selection leftwards
  * __Command + ]__: Indent current line/selection rightwards


Colorschemes
---

 * [vividchalk](https://github.com/tpope/vim-vividchalk)
 * [irblack](https://github.com/wgibbs/vim-irblack.git)


Inspiration
---

Inspired by [tpope](https://github.com/tpope), [airblade](https://github.com/airblade) and [garybernhardt](https://github.com/garybernhardt)

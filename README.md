endel/.vim
===

My awesome VIM configuration.

Usage
---

I usually use tabs for each project I'm working on simultaneously.

- [Font files](https://github.com/powerline/fonts/tree/master/FiraMono)

Key bindings
---

Leader key: `\`

**general**

- `Leader` + `Y`: copy from cursor to the end of the line
- `Ctrl` + `h`: move cursor to the left buffer
- `Ctrl` + `l`: move cursor to the right buffer
- `Ctrl` + `j`: move cursor to the bottom buffer
- `Ctrl` + `k`: move cursor to the top buffer
- `Leader` + `T`: create a new tab (:tabnew)
- `Leader` + `1`: switch to tab number 1 (1gt)
- `Leader` + `2`: switch to tab number 2 (2gt)
- `Leader` + `...`: ...you got it
- `Leader` + `0`: switch to last tab (:tablast)
- **dgh** - Get diff from left buffer (:diffget //2 | diffupdate)
- **dgl** - Get diff from right buffer (:diffget //3 | diffupdate)

**interacting with buffers**

- `Leader` + `b`: list open buffers (on this tab/project)
- `Leader` + `n`: create a new buffer
- `Leader` + `tab`: switch to last open buffer
- `Leader` + `d`: close current buffer (:bd)
- `Leader` + `D`: close current buffer without asking to save (:bd!)

**utilities**

- `Leader` + `l`: open tree viewer (:NERDTreeToggle)
- `Leader` + `u`: open undo utility (:GundoToggle)
- `Leader` + `t`: open fuzzy file finder (:CtrlP)
- `Leader` + `a` + `space` + `keyword`: search in files for _`keyword`_ (:CtrlP)

**interacting with the system clipboard**

- `Leader` + `y`: yank to the system clipboard
- `Leader` + `d`: delete to the system clipboard
- `Leader` + `p`: paste from the system clipboard
- `Leader` + `P`: paste before from the system clipboard

License
---

MIT

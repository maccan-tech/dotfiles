# Cheatcheat maccan

<!--toc:start-->
- [Cheatcheat maccan](#cheatcheat-maccan)
  - [Cheatcheat](#cheatcheat)
  - [Window navigation](#window-navigation)
    - [Split navigations](#split-navigations)
    - [Tab navigation](#tab-navigation)
  - [Terminal](#terminal)
  - [File explorer](#file-explorer)
    - [nvim-tree](#nvim-tree)
  - [Search & Replace](#search-replace)
  - [Macro](#macro)
  - [Claude Code](#claude-code)
  - [LSP & Diagnostics](#lsp-diagnostics)
  - [Misco](#misco)
<!--toc:end-->


## Cheatcheat & Help
*<leader>ch* open this cheatcheat
*<leader>fh* open Telescope help search

## Window navigation
*<leader>sv* split window vertically
*<leader>sh* split window horizontally
*<leader>se* equalize split sizes
*<leader>sx* close current split

### Split navigations
*<leader><Left>*  Left
*<leader><Down>*  Down
*<leader><Up>*    Up
*<leader><Right>* Right

### Resize splits
*<C-Left>*  Increase width
*<C-Right>* Decrease width
*<C-Up>*    Increase height
*<C-Down>*  Decrease height

### Tab navigation
*<leader>to* open new tab
*<leader>tx* close current tab
*<tab>*      go to next tab
*<S-tab>*    go to previous tab

## Terminal
*<leader>tt* Open Terminal

## File explorer
*<leader>e* open nvim-tree

### nvim-tree
*<ctrl>t* Open the file in a new tab
*<ctrl>v* Open the file in the buffer by dividing it vertically
*<ctrl>h* Open the file in the buffer by dividing it horizontally

## Search & Replace
*<leader>ff* open file search
*<leader>fs* open string search (live grep)
*<leader>fc* find string under cursor
*<leader>fb* list open buffers
*<leader>cs* clear search

```:s/pattern/replace/g```  Substitute "pattern" by "replace" on the current line.
```:%s/pattern/replace/g``` Substitute "pattern" by "replace" in the current file.

*f4*   jump to next char '4' on this line
*F4*   jump to previous char '4' on this line
*/yyy* to search for yyy then <Enter> to jump to it.
*cgn*  then type what you want to replace with then <esc> to go back to normal mode.
*n*    to jump to next, *.* to replace next string with same.

## Macro
*<leader>qa* to start recording macro into macro buffer a
*<leader>qb* to start recording macro into macro buffer b
*<leader>q*  stop recording
```@a``` execute macro
```10@a``` execute macro 10 times

## Claude Code
*<leader>ac* Toggle Claude Code terminal
*<leader>af* Focus Claude Code terminal
*<leader>ar* Resume previous Claude session
*<leader>aC* Continue Claude session
*<leader>am* Select Claude model
*<leader>ab* Add current buffer to Claude context
*<leader>as* Send selection to Claude (visual mode)
*<leader>as* Add file from file tree (in NvimTree)
*<leader>aa* Accept diff suggestion
*<leader>ad* Deny diff suggestion

## Presentations
```Presenting```  Start a markdown presentation (navigate slides with n/p, quit with q)

## LSP & Diagnostics
*<leader>d*   show diagnostics for current line (floating window)
*<leader>D*   show all buffer diagnostics (Telescope)
*[d*          jump to previous diagnostic
*]d*          jump to next diagnostic
*<leader>ca*  see available code actions
*<leader>rn*  smart rename

## Misco
```.```            repeat last command
```di'```          delete inside '
```da'```          delete around ' (di' and delete ')
*<leader>+*    increment number by 1
*<leader>-*    decrement number by 1
*<leader>gcc*  comment/uncomment line
*<leader>gc9j* comment/uncomment 9 rows
*<leader>a*    aerial outline toggle (code outline for skimming and quick navigation)

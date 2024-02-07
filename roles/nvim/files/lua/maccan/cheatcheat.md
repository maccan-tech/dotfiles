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
  - [Misco](#misco)
<!--toc:end-->


## Cheatcheat
*<leader>ch* open this cheatcheat 

## Window navigation
*<leader>sv* split window vertically
*<leader>sh* split window horizontally

### Split navigations
*<leader><Left>*  Left
*<leader><Down>*  Down
*<leader><Up>*    Up
*<leader><Right>* Right

### Tab navigation
*<space>to* tab open (open new tab)
*<tab>*     go to next tab
*<S-tab>*   go to previus tab

## Terminal
*<leader>tt* Open Termina

## File explorer
*<leader>e* open nvim-tree
### nvim-tree
*<ctrl>t* Open the file in a new tab
*<ctrl>v* Open the file in the buffer by dividing it vertically
*<ctrl>h* Open the file in the buffer by dividing it horizontally

## Search & Replace
*<leader>ff* open file search
*<leader>fs* open string search
*<leader>cs* clear search

*:s/pattern/replace/g*  Substitute “pattern” by “replace” on the current line.
*:%s/pattern/replace/g* Substitute “pattern” by “replace” in the current file.

*f4*   jump to next char '4' on this line
*F4*   jump to previus char '4' on this line
*/yyy* to search for yyy then <Enter> to jump to to it.
*cgn*  then type what you want to replce with then <esc> to go back to normal mode.
*n*    to jump to next, *.* ro replace next string with same.

## Macro
*<leader>qa* to startrecord macro in to macro buffer a
*<leader>qb* to startrecord macro in to macro buffer b
*<leader>q*  stop recording
*@a* execute macro
*10@a* execute macro 10 times
## Misco
*.*            repeat last command
*di'*          delete inside '
*da'*          delete around ' (di' and delete ')
*<leader>ca*   see available code actions
*<leader>gcc*  comment/uncomment line
*<leader>gc9j* comment/uncomment 9 rows
*<ctrl>a*      increment by 1 
*<leader>a*    aerial outline toggel (A code outline window for skimming and quick navigation)




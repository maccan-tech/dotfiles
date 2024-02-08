-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--------------------
-- general keymaps
--------------------

keymap.set("n", "<leader>ch", ":Fe ~/.config/nvim/lua/maccan/cheatcheat.md<CR>" , { desc = "Show CheatCheat in popup" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>cs", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sv", ":vnew<CR>") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sh", ":hnew<CR>") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sq", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tq", ":tabclose<CR>") -- close current tab
keymap.set("n", "<tab>", ":tabnext<CR>") --  go to next tab
keymap.set("n", "<S-tab>", ":tabprevious<CR>") --  go to previous tab

-- Terminal
-- map <Leader>tt :new term://zsh<CR>
keymap.set("n", "<leader>tt", ":new term://zsh<CR>") --  go to previous tab

-- splits navigation to leader + arrows
keymap.set("n", "<leader><Left>", "<C-w>h")
keymap.set("n", "<leader><Down>", "<C-w>j")
keymap.set("n", "<leader><Up>", "<C-w>k")
keymap.set("n", "<leader><Right>", "<C-w>l")

-- Make adjusing split sizes a bit more friendly
-- noremap <silent> <C-Left> :vertical resize +3<CR>
-- noremap <silent> <C-Right> :vertical resize -3<CR>
-- noremap <silent> <C-Up> :resize +3<CR>
-- noremap <silent> <C-Down> :resize -3<CR>

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- visual move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Help search Telescope
keymap.set("n", "<leader>h", ":Telescope help_tags") -- open new tab

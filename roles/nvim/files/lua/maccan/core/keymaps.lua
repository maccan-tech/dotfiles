-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--------------------
-- general keymaps
--------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- clear search highlights
keymap.set("n", "<leader>cs", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete char without yank" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<cmd>vnew<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<cmd>new<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-tab>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Terminal
keymap.set("n", "<leader>tt", "<cmd>new term://zsh<CR>", { desc = "Open terminal" })

-- splits navigation to leader + arrows
keymap.set("n", "<leader><Left>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<leader><Down>", "<C-w>j", { desc = "Go to lower split" })
keymap.set("n", "<leader><Up>", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<leader><Right>", "<C-w>l", { desc = "Go to right split" })

-- Resize splits
keymap.set("n", "<C-Left>", "<cmd>vertical resize +3<CR>", { desc = "Increase split width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize -3<CR>", { desc = "Decrease split width" })
keymap.set("n", "<C-Up>", "<cmd>resize +3<CR>", { desc = "Increase split height" })
keymap.set("n", "<C-Down>", "<cmd>resize -3<CR>", { desc = "Decrease split height" })

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string (live grep)" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" })

-- visual move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

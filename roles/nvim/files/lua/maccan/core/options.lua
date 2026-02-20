local opt = vim.opt -- for conciseness

-- Markdown files behave like Obsidian, *italic*, **bold** and even [links](https...) are hidden.
opt.conceallevel = 2

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- searching
opt.ignorecase = true
opt.smartcase = true

-- appearance
-- opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- misc
opt.iskeyword:append("-")
opt.scrolloff = 10

-- diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  float = {
    border = "rounded",
    source = true,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- filetypes
-- Glench/Vim-Jinja2-Syntax handles .j2 detection via ftdetect
-- It auto-detects the host language from the filename (e.g. nginx.conf.j2 -> nginx+jinja2)

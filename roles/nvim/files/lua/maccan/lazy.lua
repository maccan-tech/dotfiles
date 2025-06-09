-- auto install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { import = "maccan.plugins" },
    { import = "maccan.plugins.lsp" }
  },
  {
    -- install = {
      -- colorscheme = { "north" },
      -- colorscheme = { "catppuccin" },
    -- },
    ui = {
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "single",
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    }
  }
)

-- Set colorscheme
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme kanagawa-paper")


return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>sn",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Search notifications",
    },
    {
      "<leader>ch",
      function()
        require("snacks").win({
          file = vim.fn.expand("~/.config/nvim/lua/maccan/cheatcheat.md"),
          filetype = 'markdown',   -- Sätt filtypen för korrekt syntax highlighting
          width = 0.8,
          height = 0.8,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
      desc = "Show cheatcheat",
    },
  },
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    image = { enabled = true },
    statuscolumn = {
      enabled = true,
      left = { "mark"},
    },
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>nh",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Search notifications",
    },
    {
      "<leader>ch",
      function()
        require("snacks").win({
          file = vim.fn.expand("~/.config/nvim/lua/maccan/cheatsheet.md"),
          filetype = "markdown",
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
      desc = "Show cheatsheet",
    },
  },
  ---@type snacks.Config
  opts = {
    notifier = { enabled = true },
    image = { enabled = true },
    input = { enabled = true },
    statuscolumn = {
      enabled = true,
      left = { "mark"},
    },
  },
}

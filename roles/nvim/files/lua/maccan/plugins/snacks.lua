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

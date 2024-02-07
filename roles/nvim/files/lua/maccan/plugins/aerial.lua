return {
  -- https://github.com/stevearc/aerial.nvim#options
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  config = function()
    local aerial = require("aerial")

    aerial.setup({
      layout = {
        backends = { "treesitter", "lsp", "markdown", "man" },
        default_direction = "right",
        placement = "edge",
        resize_to_content = true,
      },
    attach_mode = "global",
    filter_kind = false,
    })

  end,
  -- Key maps
  vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>'),
}

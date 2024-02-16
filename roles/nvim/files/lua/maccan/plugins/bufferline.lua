return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  after = "catppuccin",

  config = function()
    local bufferline = require("bufferline")
    -- local mocha = require("catppuccin.palettes").get_palette "mocha"
    local highlights = require('rose-pine.plugins.bufferline')
    require('bufferline').setup({ highlights = highlights })

    bufferline.setup({
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        indicator = {
          style = 'underline',
        },
        -- highlights = require("catppuccin.groups.integrations.bufferline").get {
        -- styles = { "italic", "bold" },
        --   custom = {
        --     all = {
        --         fill = { bg = "#000000" },
        --     },
        --     mocha = {
        --         background = { fg = mocha.text },
        --     },
        --     latte = {
        --         background = { fg = "#000000" },
        --     },
        --   },
        -- },
        -- highlights = highlights, -- for theme nord
          -- offsets = {
          -- {
            -- filetype = "NvimTree",
            -- text = "File Explorer",
            -- highlight = "Directory",
            -- separator = true -- use a "true" to enable the default, or set your own character
          -- }
        -- },
      },
    })
  end,
}

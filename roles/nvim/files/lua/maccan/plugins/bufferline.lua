return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local colors = require("kanagawa.colors").setup({ theme = "wave" })
    local palette = colors.palette

    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        indicator = {
          style = "underline",
        },
      },
      highlights = {
        fill = { bg = palette.sumiInk0 },
        background = { fg = palette.fujiGray, bg = palette.sumiInk2 },
        buffer_selected = { fg = palette.fujiWhite, bg = palette.sumiInk4, bold = true },
        separator = { fg = palette.sumiInk0, bg = palette.sumiInk2 },
        separator_selected = { fg = palette.sumiInk0, bg = palette.sumiInk4 },
        separator_visible = { fg = palette.sumiInk0, bg = palette.sumiInk2 },
        tab_selected = { fg = palette.fujiWhite, bg = palette.sumiInk4, bold = true },
        tab = { fg = palette.fujiGray, bg = palette.sumiInk2 },
        tab_close = { bg = palette.sumiInk0 },
        close_button = { fg = palette.fujiGray, bg = palette.sumiInk2 },
        close_button_selected = { fg = palette.fujiWhite, bg = palette.sumiInk4 },
        close_button_visible = { fg = palette.fujiGray, bg = palette.sumiInk2 },
        modified = { fg = palette.carpYellow, bg = palette.sumiInk2 },
        modified_selected = { fg = palette.carpYellow, bg = palette.sumiInk4 },
      },
    })
  end,
}

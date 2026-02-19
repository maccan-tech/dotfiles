return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

-- Uncomment block if theme is nord
--[[
    local lualine_nord = require("lualine.themes.nord")

    -- new colors for theme
    local new_colors = {
      blue = "#65D1FF",
      -- green = "#3EFFDC",
      green = "#A3BE8C",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      black = "#000000",
      red = "#FF4A4A",
    }

    lualine_nord.insert.a.bg = new_colors.green
    lualine_nord.replace.a.bg = new_colors.red
    lualine_nord.visual.a.bg = new_colors.violet
    lualine_nord.command = {
      a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black, -- black
      },
    }
]]--

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        -- theme = lualine_nord,
        -- theme = "catppuccin",
        -- theme = "rose-pine",
        theme = "kanagawa",
      },
    })
  end,
}

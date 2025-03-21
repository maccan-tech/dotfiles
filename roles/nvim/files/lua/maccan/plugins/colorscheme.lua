-- changes to collorschema requires changes to bufferline and lualine files.
return {
--  {
--    "shaunsingh/nord.nvim", -- color scheme
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
--
--      -- set settings before loading colorschema
--      vim.g.nord_borders = true
--      vim.g.nord_contrast = true
--
--      -- load the colorscheme here
--      vim.cmd([[colorscheme nord]])
--    end,
--  },
  { "rebelot/kanagawa.nvim",    lazy = false },
  { "sho-87/kanagawa-paper.nvim"    , lazy = false, priority = 1000, opts = {}, },
  { "sainnhe/gruvbox-material", lazy = false, event = "VeryLazy", version = "*" },
  {
    -- https://github.com/catppuccin/nvim
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1001,
    config = function()
     local catppaccin = require("catppuccin")

     catppaccin.setup({
       flavour = "frappe", -- latte, frappe, macchiato, mocha
       transparent_background = true,
       integrations = {
         headlines = true,
          cmp = true,
          nvimtree = true,
          treesitter = true,
          aerial = true,
          native_lsp = {
            enabled = true,
          },
        }
      })
    end,
  },
  {
    -- https://github.com/rose-pine/neovim?tab=readme-ov-file
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1002,
    config = function()
      require('rose-pine').setup({
        disable_background = true,
      })
    end,
  },
}

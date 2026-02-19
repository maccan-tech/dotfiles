return {
  -- Active colorscheme
  { "rebelot/kanagawa.nvim", lazy = false },

  -- Available but not active -- set colorscheme in lazy.lua to switch
  { "sho-87/kanagawa-paper.nvim", lazy = true, opts = {} },
  { "sainnhe/gruvbox-material", lazy = true, version = "*" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        integrations = {
          cmp = true,
          nvimtree = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })
    end,
  },
}

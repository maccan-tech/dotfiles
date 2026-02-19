return {
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
    },
  },
  { 
    --nice markdown inline rendering
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    keys = {
      { "<leader>mr", ":RenderMarkdown toggle<CR>", desc = "Markdown Render Toggle" }
    },
    config = function()
      require("render-markdown").setup({
        heading = {
          sign = false,
          position = "inline",
          icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
          width = 'block',
          left_pad = 2,
          right_pad = 4,
        },
        code = {
          sign = false,
          left_pad = 2,
          right_pad = 4,
          border = "thick",
        },
        bullet = { right_pad = 2 },
      })
    end,
  },
}

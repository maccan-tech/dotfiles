return {
  'lukas-reineke/headlines.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    local headlines = require("headlines")

    headlines.setup({
      markdown = {
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
        fat_headline_upper_string = "",
        fat_headline_lower_string = "",
        }
    })
  end,
}

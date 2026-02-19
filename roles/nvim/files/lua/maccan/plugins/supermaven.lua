return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = { "gitcommit", "TelescopePrompt" },
      color = {
        suggestion_color = "#808080",
      },
      log_level = "off",
    })
  end,
}

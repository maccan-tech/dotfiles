return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "helix",
    win = {
      title_pos = "center",
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
  end,

}

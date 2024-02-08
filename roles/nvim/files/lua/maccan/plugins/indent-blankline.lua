return{
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    -- local highlight = {"CursorColumn","Whitespace",}

    local ibl = require("ibl")
    ibl.setup({
    indent = { char = "|" },
    -- indent = { highlight = highlight, char = "" },
    -- whitespace = {
        -- highlight = highlight,
        -- remove_blankline_trail = false,
    -- },
      scope = { enabled = false },
    })
  end,
}

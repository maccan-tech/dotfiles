return {
  "HiPhish/jinja.vim",
  config = function()
    -- treesitter disables vim syntax, re-enable it for jinja filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*jinja*",
      callback = function()
        vim.cmd("setlocal syntax=on")
      end,
    })
  end,
}

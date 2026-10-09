return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- main branch does not support lazy-loading
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- requires tree-sitter-cli and a C compiler, installs async (no-op if already installed)
      require("nvim-treesitter").install({
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "python",
        "vim",
        "vimdoc",
        "dockerfile",
        "gitignore",
        "query",
        "htmldjango",
      })

      -- highlighting and indent are no longer enabled through setup(), start them per buffer.
      -- pcall: filetypes without a parser (e.g. *.jinja) keep their vim syntax.
      -- yaml.ansible would resolve to the yaml parser, skip it to keep ansible-vim highlighting.
      local skip = { ["yaml.ansible"] = true }
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(ev)
          if not skip[ev.match] and pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

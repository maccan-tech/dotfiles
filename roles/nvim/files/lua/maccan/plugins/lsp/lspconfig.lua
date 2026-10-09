return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- advertise nvim-cmp completion capabilities to every server
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, noremap = true, silent = true, desc = desc })
        end

        map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
        map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Go to previous diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Go to next diagnostic")
        map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
        map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
      end,
    })

    vim.lsp.config("ansiblels", {
      settings = {
        ansible = {
          ansibleLint = {
            enabled = true,
            path = "ansible-lint",
          },
        },
      },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME },
          },
        },
      },
    })

    vim.lsp.enable({ "ansiblels", "marksman", "lua_ls", "html", "cssls", "pyright" })
  end,
}

# nvim

A Neovim setup in Lua, managed by lazy.nvim. It has LSP, completion,
treesitter, formatting and some markdown and note-taking tools. The colorscheme
is kanagawa. The config targets Neovim 0.12 or later.

## What's in it

| Part | Plugin | Notes |
|------|--------|-------|
| Plugin manager | lazy.nvim | Installs itself on first start. Checks for updates in the background without notifying |
| LSP | nvim-lspconfig, mason.nvim | Servers are set up with `vim.lsp.config()` and turned on with `vim.lsp.enable()` |
| Completion | nvim-cmp, LuaSnip | Sources are LSP, snippets (friendly-snippets), buffer and path |
| AI completion | supermaven-nvim | Inline suggestions in insert mode |
| Claude Code | claudecode.nvim | Commands under `<leader>a` |
| Syntax | nvim-treesitter (`main` branch) | Highlighting and indent for every filetype that has a parser |
| Ansible and Jinja | ansible-vim, jinja.vim | Vim syntax for `yaml.ansible` and `*.j2` files |
| Formatting | conform.nvim | Formats on save. Uses stylua for Lua and falls back to the LSP |
| Fuzzy finder | telescope.nvim, telescope-fzf-native | Files, live grep, buffers, help, LSP pickers |
| File explorer | nvim-tree | Opens on its own when you start Neovim with a directory |
| UI | lualine, bufferline, alpha-nvim, which-key, indent-blankline, snacks.nvim | bufferline shows tabs, not buffers |
| Git | gitsigns | |
| Markdown | render-markdown, markdown.nvim, obsidian.nvim | Obsidian vault in `~/Nextcloud/Notes` |
| Writing | zen-mode, presenting.nvim | |
| tmux | vim-tmux-navigator | Ctrl+H/J/K/L moves between splits and tmux panes |

## Languages

| Language | LSP | Treesitter | Formatter |
|----------|-----|------------|-----------|
| Ansible | ansiblels (with ansible-lint) | no, ansible-vim syntax is kept | LSP |
| YAML | | yes | |
| Lua | lua_ls | yes | stylua |
| Python | pyright | yes | LSP |
| HTML | html | yes | LSP |
| CSS | cssls | yes | LSP |
| Markdown | marksman | yes | LSP |
| Bash, JSON, Dockerfile, Vim | | yes | |
| Jinja (`*.j2`) | | no, jinja.vim syntax | |

Mason installs the LSP servers above. It also installs prettier, stylua,
eslint_d, ansible-lint and yamlfmt. Treesitter parsers are installed on start
if they are missing.

To add a language:

1. Add the server to `ensure_installed` in `files/lua/maccan/plugins/lsp/mason.lua`.
2. Add it to `vim.lsp.enable()` in `files/lua/maccan/plugins/lsp/lspconfig.lua`.
3. Add the parser to `install()` in `files/lua/maccan/plugins/nvim-treesitter.lua`.

## Key bindings

The leader key is Space. `<leader>ch` opens the full cheatsheet
(`files/lua/maccan/cheatsheet.md`), and which-key shows the bindings when you
press the leader key.

| Keys | Action |
|------|--------|
| `jk` | Leave insert mode |
| `<leader>e` | Toggle file explorer |
| `<leader>ff` / `<leader>fs` | Find files / live grep |
| `<leader>fb` / `<leader>fh` | Buffers / help tags |
| `<leader>sv` / `<leader>sh` / `<leader>sx` | Split vertical / horizontal / close split |
| `<leader>to` / `<leader>tx` / Tab / Shift+Tab | New tab / close tab / next / previous |
| `<leader>tt` | Terminal in a split |
| `gd` / `gR` / `K` | Definition / references / hover docs |
| `<leader>ca` / `<leader>rn` | Code action / rename |
| `<leader>d` / `[d` / `]d` | Line diagnostics / previous / next |
| `<leader>cf` | Format file |
| `<leader>ac` / `<leader>as` | Toggle Claude Code / send selection |
| `<leader>mr` | Toggle markdown rendering |
| `<leader>z` | Zen mode |
| `<C-l>` (insert) | Accept Supermaven suggestion |

## Colorscheme

kanagawa is active. kanagawa-paper, gruvbox-material, catppuccin and rose-pine
are installed but not loaded. To switch, change `vim.cmd("colorscheme ...")` at
the bottom of `files/lua/maccan/lazy.lua`. lualine and bufferline also use
kanagawa colors, so update `lualine.lua` and `bufferline.lua` when you switch.

## Install

From the repository root:

```bash
./bin/dotfiles --ask-become-pass --tags nvim
```

The role does the following:

- Installs the dependencies: git, make, curl, ripgrep, fd-find, gcc, nodejs
  and figlet. On Fedora it also installs gcc-c++ and tree-sitter-cli.
- Installs neovim from the distribution's package manager.
- Removes files from `~/.config/nvim/lua` that are no longer in the role, so
  deleted plugin specs stop loading.
- Copies `files/` to `~/.config/nvim`.

Plugins, Mason packages and treesitter parsers are installed the first time
Neovim starts. After upgrading plugins, run `:Lazy sync` and `:TSUpdate`.

`lazy-lock.json` is not part of the role. It stays in `~/.config/nvim` and is
not overwritten.

## Requirements

- Neovim 0.12 or later. nvim-treesitter's `main` branch and `vim.lsp.config()`
  need it.
- tree-sitter-cli 0.26 or later and a C compiler, to build treesitter parsers.
- A Nerd Font. The `nerdfonts` role installs JetBrains Mono.
- kitty, for images in snacks.nvim.

Fedora is the tested target. On Debian and Ubuntu, the packaged neovim is
older than 0.12, so the config does not work there without a newer Neovim.

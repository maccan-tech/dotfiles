return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	config = function()
		local suggestion = require("supermaven-nvim.completion_preview")

		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-l>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			-- buffer contents are sent to Supermaven's servers, keep notes and secrets local
			ignore_filetypes = { "gitcommit", "TelescopePrompt", "markdown", "text", "dotenv" },
			-- checked on BufEnter, stops Supermaven while a sensitive file is focused
			condition = function()
				local path = vim.api.nvim_buf_get_name(0)
				for _, pattern in ipairs({
					"/%.env$",
					"/%.env%.[^/]*$",
					"%.pem$",
					"%.key$",
					"%.vault$",
					"/id_[^/]*$",
					"/%.ssh/",
					"/%.gnupg/",
					"/%.netrc$",
					"secret",
					"credential",
				}) do
					if path:find(pattern) then
						return true
					end
				end
				return false
			end,
			color = {
				suggestion_color = "#808080",
			},
			log_level = "off",
		})

		vim.keymap.set("i", "<C-Right>", function()
			suggestion.on_accept_suggestion()
		end, { desc = "Accept Supermaven suggestion" })
	end,
}

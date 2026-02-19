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
			ignore_filetypes = { "gitcommit", "TelescopePrompt" },
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

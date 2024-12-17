return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		},
	},

	{
		"dchang/notes.nvim",
		-- dir = "~/repos/notes.nvim",
		opts = {
			dir = "~/Documents/wiki/",
		},
		keys = {
			{
				"<leader>n",
				function()
					require("notes").new_diary_entry()
				end,
				desc = "Notes",
			},
		},
	},
}

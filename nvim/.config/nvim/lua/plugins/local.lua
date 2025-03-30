return {
	{
		dir = vim.fn.stdpath("config") .. "/plugins/notes",
		opts = {
			dir = "~/Documents/wiki/",
		},
		keys = {
			{
				"<leader>j",
				function()
					require("notes").journal_entry()
				end,
				desc = "Notes",
			},
		},
	},
}

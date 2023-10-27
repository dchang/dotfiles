-- https://github.com/nvim-telescope/telescope.nvim
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                layout_config = {
                    horizontal = { preview_width = 0.6, width = 0.9 }
                }
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!.git" }
                }
            }
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            local tb = require("telescope.builtin")
            local vks = vim.keymap.set

            -- file pickers
            vks("n", "<leader>ff", tb.find_files, { desc = "List CWD files" })
            vks("n", "<leader>fg", tb.live_grep, { desc = "Search CWD files" })
            vks("n", "<leader>fw", tb.grep_string, { desc = "Search CWD files for selection or cursor word" })

            -- vim pickers
            vks("n", "<leader>fb", tb.buffers, { desc = "List open buffers" })
            vks("n", "<leader>fo", tb.oldfiles, { desc = "List previously open files" })
            vks("n", "<leader>fh", tb.help_tags, { desc = "List help tags" })
            vks("n", "<leader>fk", tb.keymaps, { desc = "List normal mode keymappings" })
            vks("n", "<leader>fr", tb.resume, { desc = "List previous picker state" })
            vks("n", "<leader>fm", tb.man_pages, { desc = "List man pages" })
            vks("n", "<leader>f/", tb.search_history, { desc = "List search history" })

            -- lsp pickers
            vks("n", "<leader>fs", function() tb.lsp_document_symbols({ ignore_symbols = "field" }) end,
                { desc = "List current buffer symbols" })
            vks("n", "<leader>fd", tb.diagnostics, { desc = "List diagnostics" })

            -- git pickers
            vks("n", "<leader>gf", tb.git_files, { desc = "List git files" })
            vks("n", "<leader>gc", tb.git_commits, { desc = "List all git commits" })
            vks("n", "<leader>gv", tb.git_bcommits, { desc = "List buffer git commits" })
            vks("n", "<leader>gb", tb.git_branches, { desc = "List git branches" })
            vks("n", "<leader>gs", tb.git_status, { desc = "List current changes" })
            vks("n", "<leader>gt", tb.git_status, { desc = "List stash items" })

            -- lists pickers
            vks("n", "<leader>ft", tb.builtin, { desc = "List built-in pickers" })

            -- wiki pickers
            vks("n", "<leader>wf", function() tb.find_files({ cwd = "~/Documents/wiki" }) end,
                { desc = "List wiki files" })
            vks("n", "<leader>wg", function() tb.live_grep({ cwd = "~/Documents/wiki" }) end,
                { desc = "Search wiki files" })
        end
    }
}

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
            local cmd = function(fn, ...)
                local args = { ... }
                return function() fn(unpack(args)) end
            end

            -- file pickers
            vks("n", "<leader>ff", tb.find_files, { desc = "List CWD files" })
            vks("n", "<leader>fg", tb.live_grep, { desc = "Search CWD files" })
            vks("n", "<leader>fw", tb.grep_string, { desc = "Search CWD files for selection or cursor word" })

            -- vim pickers
            vks("n", "<leader>fb", tb.buffers, { desc = "List open buffers" })
            vks("n", "<leader>fo", tb.oldfiles, { desc = "List previously open files" })
            vks("n", "<leader>fh", tb.help_tags, { desc = "List help tags" })
            vks("n", "<leader>fk", tb.keymaps, { desc = "List normal mode keymappings" })

            -- lsp pickers
            vks("n", "<leader>fs", cmd(tb.lsp_document_symbols, { symbols = { "enum", "function", "struct" } }),
                { desc = "List current buffer symbols" })
            vks("n", "<leader>fd", tb.diagnostics, { desc = "List diagnostics" })
            vks("n", "<leader>fr", tb.lsp_references, { desc = "List references for cursor word" })

            -- git pickers
            vks("n", "<leader>gf", tb.git_files, { desc = "List git files" })
            vks("n", "<leader>gc", tb.git_commits, { desc = "List git commits" })
            vks("n", "<leader>gb", tb.git_branches, { desc = "List git branches" })
            vks("n", "<leader>gs", tb.git_status, { desc = "List current changes" })

            -- wiki pickers
            vks("n", "<leader>wf", cmd(tb.find_files, { cwd = "~/Documents/wiki" }), { desc = "List wiki files" })
            vks("n", "<leader>wg", cmd(tb.live_grep, { cwd = "~/Documents/wiki" }), { desc = "Search wiki files" })
        end
    }
}

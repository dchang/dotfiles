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
            }
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            local lib = require("telescope.builtin")

            -- file pickers
            vim.keymap.set("n", "<leader>ff", function()
                lib.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
            end)
            vim.keymap.set("n", "<leader>fg", lib.git_files)
            vim.keymap.set("n", "<leader>fs", lib.live_grep)
            vim.keymap.set("n", "<leader>fw", function()
                lib.find_files({ cwd = "~/Documents/wiki" })
            end)
            vim.keymap.set("n", "<leader>fq", function()
                lib.live_grep({ cwd = "~/Documents/wiki" })
            end)

            -- vim pickers
            vim.keymap.set("n", "<leader>fb", lib.buffers)
            vim.keymap.set("n", "<leader>fv", lib.oldfiles)
            vim.keymap.set("n", "<leader>fc", lib.commands)
            vim.keymap.set("n", "<leader>fh", lib.help_tags)
            vim.keymap.set("n", "<leader>fk", lib.keymaps)

            -- lsp pickers
            vim.keymap.set("n", "<leader>fr", lib.lsp_references)
            vim.keymap.set("n", "<leader>fi", lib.lsp_incoming_calls)
            vim.keymap.set("n", "<leader>fo", lib.lsp_outgoing_calls)
            vim.keymap.set("n", "<leader>fl", function()
                lib.lsp_document_symbols({ symbols = { "enum", "function", "struct" } })
            end)
            vim.keymap.set("n", "<leader>fd", lib.diagnostics)
        end
    }
}

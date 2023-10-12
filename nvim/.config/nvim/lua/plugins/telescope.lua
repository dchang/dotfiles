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
            local vks = vim.keymap.set
            local cmd = function(fn, ...)
                local args = { ... }
                return function() fn(unpack(args)) end
            end

            -- file pickers
            vks("n", "<leader>ff", cmd(lib.find_files, { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }))
            vks("n", "<leader>fg", lib.git_files)
            vks("n", "<leader>fs", lib.live_grep)
            vks("n", "<leader>fw", cmd(lib.find_files, { cwd = "~/Documents/wiki" }))
            vks("n", "<leader>fq", cmd(lib.live_grep, { cwd = "~/Documents/wiki" }))

            -- vim pickers
            vks("n", "<leader>fb", lib.buffers)
            vks("n", "<leader>fv", lib.oldfiles)
            vks("n", "<leader>fc", lib.commands)
            vks("n", "<leader>fh", lib.help_tags)
            vks("n", "<leader>fk", lib.keymaps)

            -- lsp pickers
            vks("n", "<leader>fr", lib.lsp_references)
            vks("n", "<leader>fi", lib.lsp_incoming_calls)
            vks("n", "<leader>fo", lib.lsp_outgoing_calls)
            vks("n", "<leader>fl", cmd(lib.lsp_document_symbols, { symbols = { "enum", "function", "struct" } }))
            vks("n", "<leader>fd", lib.diagnostics)
        end
    }
}

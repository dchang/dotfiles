return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', function()
                builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })
            end, {})
            vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            vim.keymap.set('n', '<leader>fw', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fc', builtin.commands, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})

            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
            vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
            vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls, {})
            vim.keymap.set('n', '<leader>fl', function()
                builtin.lsp_document_symbols({ symbols = { "enum", "function", "struct" } })
            end, {})

            vim.keymap.set('n', '<leader>fw', function()
                builtin.find_files({ cwd = "~/Documents/wiki" })
            end, {})
            vim.keymap.set('n', '<leader>fj', function()
                builtin.find_files({ cwd = "~/Documents/wiki/diary" })
            end, {})
        end
    }
}

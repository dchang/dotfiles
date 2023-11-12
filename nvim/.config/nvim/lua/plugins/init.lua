return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "mrded/nvim-lsp-notify",
        enabled = false,
        dependencies = { "rcarriga/nvim-notify" },
        config = function()
            require("lsp-notify").setup({
                notify = require("notify")
            })
        end
    },
    {
        "stevearc/dressing.nvim",
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "iamcco/markdown-preview.nvim",
        --cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        config = function()
            vim.keymap.set("n", "<leader>rm", "<cmd>:MarkdownPreview<cr>", { desc = "Preview markdown" })
        end
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
        },
    },
    {
        "echasnovski/mini.starter",
        version = "*",
        opts = {},
    },
    {
        "echasnovski/mini.files",
        version = "*",
        config = function()
            require("mini.files").setup()
            vim.keymap.set("n", "<leader>e",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
                end,
                { desc = "Open parent directory" })
        end
    },
}

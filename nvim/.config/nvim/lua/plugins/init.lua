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
        event = "VeryLazy",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "mrded/nvim-lsp-notify",
        enabled = false,
        event = "VeryLazy",
        dependencies = { "rcarriga/nvim-notify" },
        config = function()
            require("lsp-notify").setup({
                notify = require("notify")
            })
        end
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
    },
    {
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
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
        event = "VeryLazy",
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
        event = "VeryLazy",
        version = "*",
        config = function()
            require("mini.files").setup()
            vim.keymap.set("n", "<leader>e",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0))
                end,
                { desc = "Open parent directory" })
        end
    },
}

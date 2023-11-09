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
        --"kyazdani42/nvim-web-devicons",
        "nvim-tree/nvim-web-devicons",
        enabled = false,
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
        "stevearc/oil.nvim",
        enabled = false,
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
        end
    },
    {
        "echasnovski/mini.starter",
        version = "*",
        opts = {},
    },
    {
        "echasnovski/mini.files",
        enabled = false,
        version = "*",
        config = function()
            require("mini.files").setup()
            vim.keymap.set("n", "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end,
                { desc = "Open parent directory" })
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        enabled = false,
        version = "*",
        lazy = false,
        --dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
            --vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>")
            vim.keymap.set("n", "<leader>e", function() require("nvim-tree.api").tree.toggle() end)
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup()
            vim.keymap.set("n", "<leader>e", "<cmd>:Neotree toggle<cr>")
        end
    },
}

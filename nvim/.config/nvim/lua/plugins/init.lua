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
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
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
        "williamboman/mason.nvim",
        enabled = false,
        config = function()
            require("mason").setup()
        end,
        build = ":MasonUpdate"
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeoutlen = 300
        end,
        opts = {},
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
        config = function()
            require("mini.starter").setup()
        end
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

return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "kyazdani42/nvim-web-devicons",
        --"nvim-tree/nvim-web-devicons",
        enabled = false,
    },
    {
        "stevearc/oil.nvim",
        enabled = false,
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },
    {
        "echasnovski/mini.nvim",
        enabled = false,
        version = "*",
        config = function()
            require("mini.files").setup()
            vim.keymap.set("n", "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end,
                { desc = "Open parent directory" })

        end
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
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        build = ":MasonUpdate"
    },
}

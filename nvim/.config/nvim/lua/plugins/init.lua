return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        --"kyazdani42/nvim-web-devicons",
        "nvim-tree/nvim-web-devicons",
        enabled = false,
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
    {
        "stevearc/oil.nvim",
        enabled = false,
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
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

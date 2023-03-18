return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter.install').update { with_sync = true }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    "kyazdani42/nvim-web-devicons",
    "elihunter173/dirbuf.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require('fidget').setup()
        end
    },
    --"renerocksai/telekasten.nvim",
}

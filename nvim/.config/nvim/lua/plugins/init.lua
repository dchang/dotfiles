return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            --vim.cmd([[colorscheme kanagawa]])
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
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
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_c = {
                        { 'filename', path = 1 }
                    }
                }
            }
        end
    },
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
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/neorg",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },
}

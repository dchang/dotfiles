return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            require("kanagawa").setup({
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                        TelescopeTitle = { fg = theme.ui.special, bold = true },
                        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    }
                end,
            })
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
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register({
                ["<leader>b"] = { "+buffer" },
                ["<leader>c"] = { "+code" },
                ["<leader>f"] = { "+file/find" },
                ["<leader>g"] = { "+git" },
                ["<leader>q"] = { "+quit" },
                ["<leader>r"] = { "+run" },
                ["<leader>w"] = { "+wiki" },
            })
        end
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
        config = function()
            local ms = require("mini.starter")
            ms.setup({
                items = {
                    ms.sections.recent_files(10, true),
                    ms.sections.builtin_actions(),
                },
            })
        end,
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

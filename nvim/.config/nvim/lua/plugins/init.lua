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
        event = "BufAdd",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        event = "BufAdd",
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
        event = "BufAdd",
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.keymap.set("n", "<leader>cp", "<cmd>:MarkdownPreviewToggle<cr>", { desc = "Preview" })
        end
    },
    {
        "numToStr/Comment.nvim",
        event = "BufAdd",
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
        event = "BufAdd",
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
                evaluate_single = true,
                items = {
                    ms.sections.recent_files(10, true),
                    { name = "Lazy",  action = "Lazy",  section = "Config" },
                    { name = "Mason", action = "Mason", section = "Config" },
                    ms.sections.builtin_actions(),
                },
            })
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local t = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    ms.config.footer = "⚡Loaded " .. stats.count .. " plugins in " .. t .. "ms"
                    pcall(ms.refresh)
                end,
            })
        end,
    },
    {
        "echasnovski/mini.files",
        event = "BufAdd",
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
    {
        "echasnovski/mini.pairs",
        event = "BufAdd",
        opts = {},
    },
}

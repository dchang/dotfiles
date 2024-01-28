return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = "0.9.2", -- https://github.com/MDeiml/tree-sitter-markdown/issues/131
        event = "BufAdd",
        opts = {
            ensure_installed = {
                "bash",
                "diff",
                "git_rebase",
                "gitcommit",
                "lua",
                "markdown",
                "markdown_inline",
                "regex",
                "rust",
                "toml",
                "sql",
                "yaml",
            },
            -- sync_install = false,
            auto_install = true,
            -- ignore_install = { "javascript" },
            highlight = {
                enable = true,
                --[[ disable = function(lang, buf)
                        local max_filesize = 100 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end, ]]
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            --[[ rainbow = {
                    enabled = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }, ]]
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}

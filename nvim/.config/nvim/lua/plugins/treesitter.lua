return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            -- require("nvim-treesitter.install").update({ with_sync = true })
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
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
            })
        end
    }
}

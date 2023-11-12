return {
    {
        "mfussenegger/nvim-lint",
        enabled = false,
        event = "VeryLazy",
        opts = {
            -- events = { "BufWritePost", "BufReadPost", "InsertLeave" },
            linters_by_ft = {
                markdown = { "markdownlint", "vale", },
            },
            linters = {
                "markdownlint",
                "vale",
            },
        },
        config = function(_, opts)
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end
    }
}

return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local icons = require("core").icons
            require("lualine").setup {
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "branch",
                        "diff",
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.error,
                                warn = icons.warn,
                                info = icons.info,
                                hint = icons.hint,
                            }
                        }
                    },
                    lualine_c = {
                        { "filename", path = 1, }
                    }
                }
            }
        end
    }
}

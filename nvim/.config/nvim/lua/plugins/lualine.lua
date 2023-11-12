return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        --[[ init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
        end, ]]
        opts = function()
            local icons = require("config").icons
            return {
                options = {
                    -- globalstatus = true,
                    disabled_filetypes = { statusline = { "starter" } },
                    --[[ refresh = {
                        statusline = 200,
                    } ]]
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        { "branch", icon = "" },
                    },
                    lualine_c = {
                        { "filetype", separator = "", icon_only = true, padding = { left = 1, right = 0 } },
                        {
                            "filename",
                            separator = "",
                            path = 1,
                            symbols = {
                                modified = icons.modified,
                                readonly = icons.readonly,
                            }
                        },
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.error,
                                warn = icons.warn,
                                info = icons.info,
                                hint = icons.hint,
                            },
                        },
                    },
                    lualine_x = {
                    },
                    lualine_y = {
                        {
                            "diff",
                            symbols = {
                                added = icons.added,
                                modified = icons.modified,
                                removed = icons.removed,
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_z = {
                        { "progress", padding = { left = 1, right = 0 }, separator = " " },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                }
            }
        end
    }
}

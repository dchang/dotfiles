return {
    {
        "renerocksai/telekasten.nvim",
        enabled = false,
        config = function()
            local home = vim.fn.expand("~/Documents/wiki")
            require('telekasten').setup({
                home                        = home,
                take_over_my_home           = true,
                auto_set_filetype           = true,
                auto_set_syntax             = true,
                --dailies                     = home .. '/' .. 'daily',
                dailies                     = home .. '/' .. 'diary',
                weeklies                    = home .. '/' .. 'weekly',
                templates                   = home .. '/' .. 'templates',
                image_subdir                = "img",
                extension                   = ".md",
                new_note_filename           = "title",
                uuid_type                   = "%Y%m%d%H%M",
                uuid_sep                    = "-",
                filename_space_subst        = nil,
                follow_creates_nonexisting  = true,
                dailies_create_nonexisting  = true,
                weeklies_create_nonexisting = true,
                journal_auto_open           = false,
                template_new_note           = home .. '/' .. 'templates/new_note.md',
                template_new_daily          = home .. '/' .. 'templates/daily.md',
                template_new_weekly         = home .. '/' .. 'templates/weekly.md',
                image_link_style            = "markdown",
                sort                        = "filename",
                plug_into_calendar          = true,
                calendar_opts               = {
                    weeknm = 4,
                    calendar_monday = 1,
                    calendar_mark = 'left-fit',
                },
                close_after_yanking         = false,
                insert_after_inserting      = true,
                tag_notation                = "#tag",
                command_palette_theme       = "ivy",
                show_tags_theme             = "ivy",
                subdirs_in_links            = true,
                template_handling           = "smart",
                new_note_location           = "smart",
                rename_update_links         = true,
                vaults                      = {
                    vault2 = {
                    },
                },
                media_previewer             = "telescope-media-files",
                follow_url_fallback         = nil,
            })

            vim.keymap.set('n', '<leader>zf', ":lua require('telekasten').find_notes()<CR>")
            vim.keymap.set('n', '<leader>zd', ":lua require('telekasten').find_daily_notes()<CR>")
            vim.keymap.set('n', '<leader>zg', ":lua require('telekasten').search_notes()<CR>")
            vim.keymap.set('n', '<leader>zz', ":lua require('telekasten').follow_link()<CR>")
            vim.keymap.set('n', '<leader>z', ":lua require('telekasten').panel()<CR>")
        end
    }
}
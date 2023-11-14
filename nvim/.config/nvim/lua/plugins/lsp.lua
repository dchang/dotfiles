return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufAdd",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require('lspconfig')

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "tsserver",
                    "lua_ls",
                    "sqlls",
                    "marksman",
                    "taplo",
                },
                automatic_installation = true,
            })

            vim.api.nvim_create_autocmd("BufWritePre", { callback = function() vim.lsp.buf.format() end })

            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

            local on_attach = function(_, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Jump to declaration" })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP code actions" })
                vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = "LSP signature help" })
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP rename" })
                vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end,
                    { desc = "LSP format buffer" })
                vim.keymap.set('n', '<leader>cd', '<cmd>RustOpenDocs<cr>', { desc = "Open documentation" })
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            }

            lspconfig.marksman.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                commands = {
                    RustOpenDocs = {
                        function()
                            vim.lsp.buf_request(vim.api.nvim_get_current_buf(), 'experimental/externalDocs',
                                vim.lsp.util.make_position_params(), function(err, url)
                                    if err then
                                        error(tostring(err))
                                    else
                                        vim.fn['netrw#BrowseX'](url, 0)
                                    end
                                end)
                        end,
                        description = 'Open documentation for the symbol under the cursor in default browser',
                    },
                },
            }

            lspconfig.sqlls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.taplo.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            local icons = require("config").icons
            local signs = {
                Error = icons.error,
                Warn = icons.warn,
                Info = icons.info,
                Hint = icons.hint,
            }
            for name, icon in pairs(signs) do
                name = "DiagnosticSign" .. name
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = name })
            end
            vim.diagnostic.config({
                severity_sort = true,
            })
        end
    },
}

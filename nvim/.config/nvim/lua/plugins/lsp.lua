return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local opts = { noremap = true, silent = true }

            vim.api.nvim_create_autocmd("BufWritePre", { callback = function() vim.lsp.buf.format() end })

            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            local on_attach = function(_, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
                vim.keymap.set('n', '<leader>cd', '<cmd>RustOpenDocs<cr>', bufopts)
            end

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
    }
}

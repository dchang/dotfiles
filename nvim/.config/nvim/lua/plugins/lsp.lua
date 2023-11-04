return {
    {
        "neovim/nvim-lspconfig",
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
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            -- rust
            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            -- lua
            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            -- sql
            lspconfig.sqlls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            -- typescript
            lspconfig.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            -- javascript
            lspconfig.denols.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    'markdown',
                },
            }
        end
    }
}

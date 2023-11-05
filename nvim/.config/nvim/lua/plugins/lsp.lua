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

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

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

            lspconfig.sqlls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.marksman.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.taplo.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            mason.setup()
            mason_lspconfig.setup({
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
        end
    },
}

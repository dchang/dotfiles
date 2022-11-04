local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update { with_sync = true } end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'elihunter173/dirbuf.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                        }
                    }
                }
            }
        end
    }
    use { 'rebelot/kanagawa.nvim', config = 'vim.cmd[[colorscheme kanagawa]]' }
    -- use { 'folke/tokyonight.nvim', config = 'vim.cmd[[colorscheme tokyonight]]' }
    use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end }
    --[[
    use {
        'folke/noice.nvim',
        config = function()
            require('noice').setup()
            -- require('telescope').load_extension('noice')
        end,
        requires = {
            'MunifTanjim/nui.nvim',
            -- 'rcarriga/nvim-notify',
        }
    }
    --]]
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = { { path = '~/Documents/wiki/', syntax = 'markdown', ext = '.md' } }
            vim.g.vimwiki_global_ext = 0
        end
    }
    --[[
    use {
        'lervag/wiki.vim',
        config = function()
            vim.g.wiki_root = '~/Documents/wiki'
            vim.g.wiki_filetypes = { 'md' }
            vim.g.wiki_link_extension = '.md'
        end
    }
    --]]

    if packer_bootstrap then
        require('packer').sync()
    end
end)

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
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'kyazdani42/nvim-web-devicons'
  use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end }
  use { 'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end }
  use { 'rebelot/kanagawa.nvim', config = 'vim.cmd[[colorscheme kanagawa]]' }
  -- use { 'folke/tokyonight.nvim', config = 'vim.cmd[[colorscheme tokyonight]]' }
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = { { path = '~/Documents/wiki/', syntax = 'markdown', ext = '.md' } }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

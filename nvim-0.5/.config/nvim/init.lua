--[[
https://github.com/nanotee/nvim-lua-guide
https://oroques.dev/notes/neovim-init/
https://alpha2phi.medium.com/neovim-init-lua-e80f4f136030
https://github.com/Gavinok/dotneovim
--]]

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

local paq_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(paq_path)) > 0 then
	local ex = vim.api.nvim_command
	ex('!git clone --depth=1 https://github.com/savq/paq-nvim '..paq_path)
	ex('packadd paq-nvim')
end

require 'paq' {
	'savq/paq-nvim';
	'lifepillar/vim-gruvbox8';
}

cmd 'colorscheme gruvbox8_hard'

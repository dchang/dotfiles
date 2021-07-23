--[[
## References

- https://github.com/nanotee/nvim-lua-guide
- https://oroques.dev/notes/neovim-init/
- https://alpha2phi.medium.com/neovim-init-lua-e80f4f136030
- https://github.com/Gavinok/dotneovim
--]]

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local paq_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(paq_path)) > 0 then
	cmd('!git clone --depth=1 https://github.com/savq/paq-nvim '..paq_path)
	cmd('packadd paq-nvim')
end

require 'paq' {
	'savq/paq-nvim';
	'lifepillar/vim-gruvbox8';
	'dstein64/vim-startuptime';
	'junegunn/fzf';
	'junegunn/fzf.vim';
}

cmd 'colorscheme gruvbox8_hard'

opt.relativenumber = true -- show relative line numbers
opt.tabstop = 4           -- tab size
opt.shiftwidth = 0        -- use tabstop

g.mapleader = ' '

local function nnoremap(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true}) end

nnoremap('Y', 'y$')
nnoremap('<leader>fw',  ':Windows<CR>')
nnoremap('<leader>fa',  ':Files<CR>')
nnoremap('<leader>fs',  ':Rg<CR>')
nnoremap('<leader>ff',  ':Buffers<CR>')
nnoremap('<leader>fg',  ':GFiles -co --exclude-standard<CR>')
nnoremap('<leader>fh',  ':History<CR>')
nnoremap('<leader>fl',  ':Lines<CR>')
nnoremap('<leader>fc',  ':Commits<CR>')
nnoremap('<leader>fb',  ':BCommits<CR>')
nnoremap('<leader>fm',  ':Maps<CR>')

--[[
## TODO

- [ ] Plugins
- [ ] Options
- [ ] Mappings
- [ ] Fuzzy search - fzf or Telescope
- [ ] Tree-sitter
- [ ] LSP - Lua, Rust, JS
- [ ] Vimwiki
--]]


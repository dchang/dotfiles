--[[
## References

- https://github.com/nanotee/nvim-lua-guide
- https://oroques.dev/notes/neovim-init/
- https://alpha2phi.medium.com/neovim-init-lua-e80f4f136030
- https://github.com/Gavinok/dotneovim
- https://sharksforarms.dev/posts/neovim-rust/
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
	'junegunn/fzf';
	'junegunn/fzf.vim';
	'vimwiki/vimwiki';
	'neovim/nvim-lspconfig';
	--'dstein64/vim-startuptime';
	--'nvim-lua/lsp-status.nvim';
	'hoob3rt/lualine.nvim';
	--'kyazdani42/nvim-web-devicons';
	--'ryanoasis/vim-devicons';
}

cmd 'colorscheme gruvbox8_hard'

opt.relativenumber = true -- show relative line numbers
opt.tabstop = 4           -- tab size
opt.shiftwidth = 0        -- use tabstop

g.mapleader = ' '

local nnoremap = function(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true}) end

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

g.vimwiki_list = { { path = '~/Documents/wiki', syntax = 'markdown', ext = '.md' } }

nnoremap('gD',  '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('gd',  '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('gi',  '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<C-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nnoremap('<leader>wa',  '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
nnoremap('<leader>wr',  '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
nnoremap('<leader>wl',  '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
nnoremap('<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>')
nnoremap('<leader>ca',  '<cmd>lua vim.lsp.buf.code_action()<CR>')
nnoremap('gr',  '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('<leader>e',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
nnoremap('[d',  '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
nnoremap(']d',  '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
nnoremap('<leader>ds',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
nnoremap('<leader>df',  '<cmd>lua vim.lsp.buf.formatting()<CR>')

--local lsp_status = require('lsp-status')
--lsp_status.register_progress()
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup{
	--on_attach = lsp_status.on_attach,
	--capabilities = lsp_status.capabilities
}
--local sl = ''
--sl = sl..[[%!luaeval("require('lsp-status').status()")]]
--opt.statusline = sl

require('lualine').setup()


--[[
## TODO

- [ ] Plugins
- [ ] Options
- [ ] Mappings
- [ ] Fuzzy search - fzf or Telescope
- [ ] Tree-sitter
- [ ] LSP - Lua, Rust, JS
- [ ] Vimwiki
- [ ] lsp-status
--]]


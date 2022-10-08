--[[
https://github.com/nanotee/nvim-lua-guide
https://github.com/brainfucksec/neovim-lua
--]]

require("paq-init")
require("core/options")
require("core/keymaps")
require("lsp")
require("plugins/nvim-treesitter")
require("plugins/telescope")

local cmd = vim.cmd
local g = vim.g

--cmd 'colorscheme gruvbox8_hard'
--cmd 'colorscheme tokyonight-night'
--g.gruvbox_material_background = 'hard'
--g.gruvbox_material_foreground = 'material'
--cmd 'colorscheme gruvbox-material'
cmd 'colorscheme kanagawa'


--[[
-- fzf
nnoremap('<leader>fw', ':Windows<CR>')
nnoremap('<leader>fa', ':Files<CR>')
nnoremap('<leader>fs', ':Rg<CR>')
nnoremap('<leader>ff', ':Buffers<CR>')
nnoremap('<leader>fg', ':GFiles -co --exclude-standard<CR>')
nnoremap('<leader>fh', ':History<CR>')
nnoremap('<leader>fl', ':Lines<CR>')
nnoremap('<leader>fc', ':Commits<CR>')
nnoremap('<leader>fb', ':BCommits<CR>')
nnoremap('<leader>fm', ':Maps<CR>')
--]]

-- vimwiki
g.vimwiki_list = { { path = '~/Documents/wiki', syntax = 'markdown', ext = '.md' } }


--[[
https://github.com/nanotee/nvim-lua-guide
https://github.com/brainfucksec/neovim-lua
--]]

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local api = vim.api

local paq_path = fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(paq_path)) > 0 then
    cmd('!git clone --depth=1 https://github.com/savq/paq-nvim '..paq_path)
    cmd('packadd paq-nvim')
end

require 'paq' {
    'savq/paq-nvim';

    'junegunn/fzf';
    'junegunn/fzf.vim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';

    'vimwiki/vimwiki';
    'neovim/nvim-lspconfig';
    'nvim-treesitter/nvim-treesitter';
    --'kabouzeid/nvim-lspinstall';
    --'lifepillar/vim-gruvbox8';
    --'nvim-lua/lsp-status.nvim';
    --'hoob3rt/lualine.nvim';

    --'tweekmonster/startuptime.vim';

    --'folke/tokyonight.nvim';
    'rebelot/kanagawa.nvim';
    --'sainnhe/gruvbox-material';

    -- sandbox
    --'nvim-lua/plenary.nvim';
    --'nvim-lua/completion-nvim';
    --'hrsh7th/nvim-compe';
    --'kyazdani42/nvim-web-devicons';
    --'ryanoasis/vim-devicons';
    --'anott03/nvim-lspinstall';
    --'alexaandru/nvim-lspupdate';
    --'williamboman/nvim-lsp-installer';
}

opt.number = true         -- show current line number
opt.relativenumber = true -- show relative line numbers
opt.colorcolumn = '100'   -- highlight screen column
opt.expandtab = true      -- use spaces for indents
opt.tabstop = 4           -- tab size
opt.shiftwidth = 0        -- use tabstop
opt.swapfile = false      -- disable swapfile creation
opt.hidden = true         -- allow unsaved buffer change
opt.termguicolors = true  -- enable 24-bit color
opt.shell = '/bin/bash'   -- avoid fish shell slowdown

--cmd 'colorscheme gruvbox8_hard'
--cmd 'colorscheme tokyonight-night'
cmd 'colorscheme kanagawa'
--g.gruvbox_material_background = 'hard'
--g.gruvbox_material_foreground = 'material'
--cmd 'colorscheme gruvbox-material'

g.mapleader = ' '

local nnoremap = function(lhs, rhs) api.nvim_set_keymap('n', lhs, rhs, {noremap = true}) end
local vnoremap = function(lhs, rhs) api.nvim_set_keymap('v', lhs, rhs, {noremap = true}) end

nnoremap('Y', 'y$') -- yank from cursor to EOL
nnoremap(';', ':')  -- enter from normal to command mode
vnoremap(';', ':')  -- enter from visual to command mode

nnoremap('<leader>sv', ':source $MYVIMRC<CR>')
nnoremap('<leader>ba', ':%bd<CR>')

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

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- vimwiki
g.vimwiki_list = { { path = '~/Documents/wiki', syntax = 'markdown', ext = '.md' } }

-- nvim-lspconfig

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

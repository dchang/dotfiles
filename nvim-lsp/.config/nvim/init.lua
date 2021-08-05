--[[
## TODO

- [ ] Plugins
- [ ] Options
- [ ] Mappings
- [ ] Fuzzy search - fzf or Telescope
- [ ] LSP - Lua, Rust
- [ ] LSP - completion
- [ ] Treesitter
- [ ] Vimwiki
- [ ] statusline

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
local api = vim.api

local paq_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
if fn.empty(fn.glob(paq_path)) > 0 then
    cmd('!git clone --depth=1 https://github.com/savq/paq-nvim '..paq_path)
    cmd('packadd paq-nvim')
end

require 'paq' {
    'savq/paq-nvim';
    'tweekmonster/startuptime.vim';
    'lifepillar/vim-gruvbox8';
    'junegunn/fzf';
    'junegunn/fzf.vim';
    'vimwiki/vimwiki';
    --'nvim-lua/plenary.nvim';
    'neovim/nvim-lspconfig';
    'nvim-treesitter/nvim-treesitter';
    --'nvim-lua/completion-nvim';
    --'hrsh7th/nvim-compe';
    'nvim-lua/lsp-status.nvim';
    'hoob3rt/lualine.nvim';
    --'kyazdani42/nvim-web-devicons';
    --'ryanoasis/vim-devicons';
}

opt.relativenumber = true -- show relative line numbers
opt.colorcolumn = '100'   -- highlight screen column
opt.expandtab = true      -- use spaces for indents
opt.tabstop = 4           -- tab size
opt.shiftwidth = 0        -- use tabstop
opt.swapfile = false      -- disable swapfile creation
opt.hidden = true         -- allow unsaved buffer change
opt.termguicolors = true  -- enable 24-bit color
--opt.list = true           -- show tabs

cmd 'colorscheme gruvbox8_hard'

g.mapleader = ' '
g.vimwiki_list = { { path = '~/Documents/wiki', syntax = 'markdown', ext = '.md' } }

local nnoremap = function(lhs, rhs) api.nvim_set_keymap('n', lhs, rhs, {noremap = true}) end

nnoremap('Y', 'y$')
nnoremap('<leader>sv', ':source $MYVIMRC<CR>')

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

nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nnoremap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nnoremap('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
nnoremap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
nnoremap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
nnoremap('<leader>ds', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
nnoremap('<leader>df', '<cmd>lua vim.lsp.buf.formatting()<CR>')

--[[
vim.o.completeopt = 'menuone,noselect'
require'compe'.setup{
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };
    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = false;
        ultisnips = true;
        luasnip = true;
    };
}
local inoremap = function(lhs, rhs) api.nvim_set_keymap('i', lhs, rhs, {expr = true}) end
inoremap('<C-s>', 'compe#complete()')
inoremap('<CR>', 'compe#confirm("<CR>")')
inoremap('<C-e>', 'compe#close("<C-e>")')
inoremap('<C-f>', 'compe#scroll({ "delta": +4 })')
inoremap('<C-d>', 'compe#scroll({ "delta": -4 })')
--]]

local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lspconfig.rust_analyzer.setup{
    on_attach = function(client, bufnr)
        --require'completion'.on_attach(client, bufnr)
        lsp_status.on_attach(client, bufnr)
    end,
    capabilities = lsp_status.capabilities
}

api.nvim_exec('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_seq_sync()', false)

--require'plenary.reload'.reload_module('lualine', true)
require'lualine'.setup {
    options = {
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_x = {require'lsp-status'.status},
        lualine_y = {'location'},
        lualine_z = {},
    }
}

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'lua', 'rust', 'toml'},
    highlight = {
        enable = true,
    }
}


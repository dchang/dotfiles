local paq_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(paq_path)) > 0 then
    vim.cmd('!git clone --depth=1 https://github.com/savq/paq-nvim ' .. paq_path)
    vim.cmd('packadd paq-nvim')
end

require 'paq' {
    'savq/paq-nvim';

    --'junegunn/fzf';
    --'junegunn/fzf.vim';
    'nvim-lua/plenary.nvim';
    { 'nvim-telescope/telescope.nvim', tag = '0.1.0' };

    'neovim/nvim-lspconfig';
    'nvim-treesitter/nvim-treesitter';
    --'kabouzeid/nvim-lspinstall';

    --'nvim-lua/lsp-status.nvim';
    --'feline-nvim/feline.nvim';
    'nvim-lualine/lualine.nvim';
    'kyazdani42/nvim-web-devicons';

    'vimwiki/vimwiki';

    --'tweekmonster/startuptime.vim';

    --'lifepillar/vim-gruvbox8';
    --'folke/tokyonight.nvim';
    --'sainnhe/gruvbox-material';
    'rebelot/kanagawa.nvim';

    -- sandbox
    --'folke/trouble.nvim';
    --'folke/lsp-colors.nvim';
    --'nvim-lua/completion-nvim';
    --'hrsh7th/nvim-compe';
    --'ryanoasis/vim-devicons';
    --'anott03/nvim-lspinstall';
    --'alexaandru/nvim-lspupdate';
    --'williamboman/nvim-lsp-installer';
}

--require("trouble").setup()

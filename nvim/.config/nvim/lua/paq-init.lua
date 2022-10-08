local paq_path = vim.fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(paq_path)) > 0 then
    vim.cmd('!git clone --depth=1 https://github.com/savq/paq-nvim '..paq_path)
    vim.cmd('packadd paq-nvim')
end

require 'paq' {
    'savq/paq-nvim';

    --'junegunn/fzf';
    --'junegunn/fzf.vim';
    'nvim-lua/plenary.nvim';
    {'nvim-telescope/telescope.nvim', tag = '0.1.0'};

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


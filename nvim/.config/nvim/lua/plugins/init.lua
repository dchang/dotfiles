return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    "kyazdani42/nvim-web-devicons",
    "elihunter173/dirbuf.nvim",
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        build = ":MasonUpdate"
    },
}

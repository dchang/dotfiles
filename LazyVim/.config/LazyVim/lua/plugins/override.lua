return {
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headline_upper_string = "▁",
        fat_headline_lower_string = "▔",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "dchang/notes.nvim",
    keys = {
      {
        "<leader>n",
        function()
          require("notes").greet()
        end,
        desc = "Notes",
      },
    },
  },
}

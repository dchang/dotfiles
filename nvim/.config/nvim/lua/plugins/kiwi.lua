return {
    "serenevoid/kiwi.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        {
            name = "default",
            path = "/home/dchang/Documents/wiki"
        }
    },
    keys = {
        { "<leader>wn", ":lua require(\"kiwi\").open_diary_new()<cr>", desc = "Open today's Diary" },
    },
    lazy = true
}

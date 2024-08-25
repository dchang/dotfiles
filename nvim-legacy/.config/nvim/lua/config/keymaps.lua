local map = vim.keymap.set

vim.g.mapleader = " "

map({ "n", "v" }, "<leader><space>", ":", { desc = "Command line mode" })

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<leader>l", ":bn<CR>", { desc = "Next buffer" })
map("n", "<leader>h", ":bp<CR>", { desc = "Previous buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })
map("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all other buffers" })

-- misc
map("n", "<leader>/", ":noh<CR>", { desc = "Clear search", silent = true })
map("n", "<leader>rl", ":luafile %<CR>", { desc = "Run current lua file" })
map("n", "<leader>qq", ":qa<cr>", { desc = "Quit all" })
--vks("n", "<leader>rr", ":source $MYVIMRC<CR>") -- reload config

local new_diary_entry = function()
    local fn = vim.fn
    local dir = fn.expand("~/Documents/wiki/diary/" .. os.date("%Y"))
    if fn.isdirectory(dir) == 0 then
        fn.mkdir(dir, "p")
    end
    local file = dir .. os.date("/%Y%m%d.md")
    local bn = fn.bufnr(file, true)
    vim.api.nvim_win_set_buf(0, bn)
end
vim.keymap.set("n", "<leader>wn", new_diary_entry, { desc = "New diary entry" })

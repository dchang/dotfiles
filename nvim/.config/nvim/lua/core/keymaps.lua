vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, '<leader><space>', ':')
vim.keymap.set('n', '<leader>l', ':bn<CR>') -- next buffer
vim.keymap.set('n', '<leader>h', ':bp<CR>') -- previous buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>') -- unload current buffer
vim.keymap.set('n', '<leader>ba', ':%bd<CR>', { desc = "Close all buffers" })
vim.keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>', { desc = "Close all other buffers" })
vim.keymap.set('n', '<leader>/', ':noh<CR>', { desc = "Disable search matches highlighting", silent = true })
vim.keymap.set('n', '<leader>rl', ':luafile %<CR>') -- execute lua script in current buffer
--vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>') -- reload config

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
vim.keymap.set('n', '<leader>wn', new_diary_entry, { desc = "New diary entry" })

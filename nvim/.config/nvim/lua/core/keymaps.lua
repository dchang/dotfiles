vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, '<leader><space>', ':')

vim.keymap.set('n', '<leader>l', ':bn<CR>') -- next buffer
vim.keymap.set('n', '<leader>h', ':bp<CR>') -- previous buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>') -- unload current buffer
vim.keymap.set('n', '<leader>ba', ':%bd<CR>') -- unload all buffers
vim.keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>') -- unload all buffers except current

vim.keymap.set('n', '<leader>/', ':noh<CR>', { silent = true }) -- stop highlighting search matches

vim.keymap.set('n', '<leader>rl', ':luafile %<CR>') -- execute lua script in current buffer
vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>') -- reload config

-- new diary entry
vim.keymap.set('n', '<leader>wn', function()
    local fn = vim.fn
    local dir = fn.expand("~/Documents/wiki/diary/" .. os.date("%Y"))
    if fn.isdirectory(dir) == 0 then
        fn.mkdir(dir, "p")
    end
    local file = dir .. os.date("/%Y%m%d.md")
    local bn = fn.bufnr(file, true)
    vim.api.nvim_win_set_buf(0, bn)
end)

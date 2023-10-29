local vks = vim.keymap.set

vim.g.mapleader = ' '

vks({ 'n', 'v' }, '<leader><space>', ':')
vks('n', '<leader>l', ':bn<CR>') -- next buffer
vks('n', '<leader>h', ':bp<CR>') -- previous buffer
vks('n', '<leader>bd', ':bd<CR>') -- unload current buffer
vks('n', '<leader>ba', ':%bd<CR>', { desc = "Close all buffers" })
vks('n', '<leader>bo', ':%bd|e#|bd#<CR>', { desc = "Close all other buffers" })
vks('n', '<leader>/', ':noh<CR>', { desc = "Disable search matches highlighting", silent = true })
vks('n', '<leader>rl', ':luafile %<CR>') -- execute lua script in current buffer
vks('n', '<leader>qq', ':q<cr>') -- quit neovim
--vks('n', '<leader>rr', ':source $MYVIMRC<CR>') -- reload config

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

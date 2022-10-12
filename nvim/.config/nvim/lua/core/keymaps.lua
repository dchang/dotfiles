vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, ';', ':')

vim.keymap.set('n', '<leader>rl', ':luafile %<CR>') -- execute lua script in current buffer
vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>') -- reload config
vim.keymap.set('n', '<leader>ba', ':%bd<CR>') -- unload all buffers
vim.keymap.set('n', '<leader>/', ':noh<CR>', { silent = true }) -- stop highlighting search matches

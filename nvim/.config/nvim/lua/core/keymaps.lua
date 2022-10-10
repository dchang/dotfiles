vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'v' }, ';', ':')

vim.keymap.set('n', '<leader>r', ':luafile %<CR>') -- execute lua script in current buffer
vim.keymap.set('n', '<leader>ba', ':%bd<CR>') -- unload all buffers

vim.keymap.set('n', '<leader>/', ':noh<CR>', { silent = true }) -- stop highlighting search matches

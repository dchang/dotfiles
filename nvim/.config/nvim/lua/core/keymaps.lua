vim.g.mapleader = ' '

vim.keymap.set('n', 'Y', 'y$') -- yank from cursor to EOL
vim.keymap.set({ 'n', 'v' }, ';', ':')

vim.keymap.set('n', '<leader>sv', ':luafile $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>ba', ':%bd<CR>')

vim.keymap.set('n', '<leader>/', ':noh<CR>', { silent = true })

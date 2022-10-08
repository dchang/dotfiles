local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

map('n', 'Y', 'y$') -- yank from cursor to EOL
map('n', ';', ':')  -- enter from normal to command mode
map('v', ';', ':')  -- enter from visual to command mode

map('n', '<leader>sv', ':source $MYVIMRC<CR>')
map('n', '<leader>ba', ':%bd<CR>')


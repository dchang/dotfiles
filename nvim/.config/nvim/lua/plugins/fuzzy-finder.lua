local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<CR>', {})

--[[
-- fzf
nnoremap('<leader>fw', ':Windows<CR>')
nnoremap('<leader>fa', ':Files<CR>')
nnoremap('<leader>fs', ':Rg<CR>')
nnoremap('<leader>ff', ':Buffers<CR>')
nnoremap('<leader>fg', ':GFiles -co --exclude-standard<CR>')
nnoremap('<leader>fh', ':History<CR>')
nnoremap('<leader>fl', ':Lines<CR>')
nnoremap('<leader>fc', ':Commits<CR>')
nnoremap('<leader>fb', ':BCommits<CR>')
nnoremap('<leader>fm', ':Maps<CR>')
--]]

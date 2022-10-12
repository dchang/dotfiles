vim.api.nvim_create_augroup('default', { clear = true })

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'default',
    pattern = '*',
    callback = function() vim.highlight.on_yank() end
})

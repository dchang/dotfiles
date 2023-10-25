local g = vim.api.nvim_create_augroup("Default", {})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
    group = g,
    callback = function() vim.highlight.on_yank() end
})

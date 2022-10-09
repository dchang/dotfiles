local opt = vim.opt

opt.number = true -- show current line number
opt.relativenumber = true -- show relative line numbers
opt.colorcolumn = '100' -- highlight screen column
opt.expandtab = true -- use spaces for indents
opt.tabstop = 4 -- tab size
opt.shiftwidth = 0 -- use tabstop
opt.swapfile = false -- disable swapfile creation
opt.hidden = true -- allow unsaved buffer change
opt.termguicolors = true -- enable 24-bit color
opt.shell = '/bin/bash' -- avoid fish shell slowdown

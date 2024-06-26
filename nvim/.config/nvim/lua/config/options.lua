local opt = vim.opt
local o = vim.o

opt.colorcolumn = "100"   -- highlight screen column
opt.cursorline = true     -- highlight current line
opt.expandtab = true      -- use spaces for indents
opt.hidden = true         -- allow unsaved buffer change
opt.number = true         -- show current line number
opt.pumheight = 10        -- popup menu max number of items
opt.relativenumber = true -- show relative line numbers
opt.scrolloff = 2         -- minimal number of screen lines to keep above and below the cursor
opt.shiftwidth = 0        -- use tabstop
opt.showmode = false      -- redundant with statusline
opt.signcolumn = "yes"    -- always draw the signcolumn
opt.swapfile = false      -- disable swapfile creation
opt.tabstop = 4           -- tab size
opt.termguicolors = true  -- enable 24-bit RGB color

o.timeoutlen = 300        -- ms to wait for a mapped sequence to complete

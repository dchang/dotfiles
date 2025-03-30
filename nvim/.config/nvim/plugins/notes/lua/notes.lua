local api = vim.api
local fn = vim.fn
local fs = vim.fs

local M = {}

M.defaults = {
	dir = nil,
}

M.options = nil

function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

function M.journal_entry()
	local dir = fn.expand(M.options.dir)
	local file = fs.joinpath(dir, "diary", os.date("%Y"), os.date("%Y%m%d.md"))
	local parent = fs.dirname(file)
	if fn.isdirectory(parent) == 0 then
		fn.mkdir(parent, "p")
	end
	local bn = fn.bufnr(file, true)
	api.nvim_win_set_buf(0, bn)
	if fn.filereadable(file) == 0 then
		api.nvim_buf_set_lines(bn, 0, 0, false, { "# " .. os.date("%B %d, %Y") })
	end
end

return M

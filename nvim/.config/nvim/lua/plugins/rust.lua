return {
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
            src = {
                cmp = { enabled = true },
            },
        },
    },
    {
        "simrat39/rust-tools.nvim",
        enabled = false,
        opts = function()
            local ok, mason_registry = pcall(require, "mason-registry")
            local adapter
            if ok then
                local codelldb = mason_registry.get_package("codelldb")
                local extension_path = codelldb:get_install_path() .. "/extension/"
                local codelldb_path = extension_path .. "adapter/codelldb"
                local liblldb_path = ""
                if vim.loop.os_uname().sysname:find("Windows") then
                    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
                elseif vim.fn.has("mac") == 1 then
                    liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
                else
                    liblldb_path = extension_path .. "lldb/lib/liblldb.so"
                end
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
            end
            return {
                dap = {
                    adapter = adapter,
                },
            }
        end,
    },
}

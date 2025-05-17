AwyrVim.custom.plugins = require("custom.plugins")
require("custom.keys")

-- vim.list_extend(AwyrVim.configs.cmp().sources, { { name = "lazydev" } })
AwyrVim.custom.configs.cmp = function(old)
	vim.list_extend(old.sources, { { name = "lazydev" } })
end

-- vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")
vim.lsp.enable("autotools_ls")
vim.lsp.enable("clangd")

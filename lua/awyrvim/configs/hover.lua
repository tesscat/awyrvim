local M = {}

M.init = function()
	require("hover.providers.lsp")
	require("hover.providers.diagnostic")
	require("hover.providers.dap")
end

M.preview_opts = { border = "single" }

M.preview_window = false
M.title = true
M.mouse_providers = { "LSP" }
M.mouse_delay = 250

return M

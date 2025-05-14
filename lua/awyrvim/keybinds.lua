local M = {}
local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
	operator_pending_mode = "o",
}

local default_opts = { silent = true }

local keybinds = vim.tbl_deep_extend("force", AwyrVim.builtin.keybinds, AwyrVim.custom.keybinds)

for modekey, v in pairs(keybinds) do
	for bindkey, body in pairs(v) do
		local key
		local opts
		local bind
		if type(bindkey) == "table" then
			bind = bindkey[0]
		else
			bind = bindkey
		end
		if type(body) == "table" then
			key = body[1]
			opts = body[2]
		else
			key = body
			opts = default_opts
		end
		vim.keymap.set(mode_adapters[modekey], bind, key, opts)
	end
end

return M

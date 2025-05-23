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

local function merge_key_arrays(a1, a2)
	local out = {}
	for idx, v in ipairs(a1) do
		out[v[1]] = v
	end
	for idx, v in ipairs(a2) do
		out[v[1]] = v
	end
	local arr = {}
	for _, v in pairs(out) do
		table.insert(arr, v)
	end
	return arr
end

local keybinds = {}

for k, v in pairs(AwyrVim.builtin.keybinds) do
	keybinds[k] = merge_key_arrays(v, AwyrVim.custom.keybinds[k])
end

local wk = require("which-key")

for modekey, v in pairs(keybinds) do
	v["mode"] = mode_adapters[modekey]
	wk.add(v)
end

return M

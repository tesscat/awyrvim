-- Based on alpha's dashboard theme
require("alpha.term")

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(AwyrVim.leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

--[[

local function remove_escaped_colors(str)
	return str:gsub("\27%[[0-9;]*m", "")
end

local function get_ascii_image_dim(path)
	local width = 0
	local height = 0

	local pfile = io.open(path, "r")

	for line in pfile:lines() do
		-- Take into account colored output
		line = remove_escaped_colors(line)
		local current_width = vim.fn.strdisplaywidth(line)
		if current_width > width then
			width = current_width
		end
		height = height + 1
	end

	-- For some reason, after the last update or something,
	-- I have to add 2 to width, otherwise the image is not
	-- displayed correctly
	width = width + 2

	return { width, height }
end

local imdim = get_ascii_image_dim(vim.fn.stdpath("config") .. "/static/icon.ccat")

error("w" .. tostring(imdim[1]) .. "h" .. tostring(imdim[2]))
--]]

local header = {
	type = "terminal",
	command = "cat | cat " .. get_awyrvim_base_dir() .. "static/icon.ccat",
	-- hard-coded from icon.ccat
	width = 58,
	height = 28,

	opts = {
		redraw = true,
	},
}

-- building the footer
local user_plugins = vim.tbl_count(AwyrVim.custom.plugins)
local user_plugins_text = tostring(user_plugins) .. " custom plugin"
if user_plugins ~= 1 then
	user_plugins_text = user_plugins_text .. "s"
end

-- get git version/tag/hash
local stdout, ret = require("plenary.job")
	:new({ command = "git", args = { "describe", "--tags", "--always" }, cwd = get_awyrvim_base_dir() })
	:sync(10000)
local version = "unknown"
if ret == 0 then
	version = stdout[1]
end

local nvim_vers = vim.version()

local footer = {
	type = "text",
	val = "awyrvim@"
		.. version
		.. " | neovim@v"
		.. nvim_vers.major
		.. "."
		.. nvim_vers.minor
		.. "."
		.. nvim_vers.patch
		.. " | "
		.. user_plugins_text,
	opts = {
		position = "center",
	},
}

local buttons = {
	type = "group",
	val = {
		button("e", "  New file", "<cmd>ene <CR>"),
		button(AwyrVim.leader .. " f f", "󰈞  Find file"),
		button(AwyrVim.leader .. " f h", "󰊄  Recently opened files"),
		button(AwyrVim.leader .. " f r", "  Frecency/MRU"),
		button(AwyrVim.leader .. " f g", "󰈬  Find word"),
		button(AwyrVim.leader .. " f m", "  Jump to bookmarks"),
		button(AwyrVim.leader .. " s l", "  open last session"),
	},
	opts = {
		spacing = 1,
	},
}

return {
	layout = {
		{ type = "padding", val = 2 },
		header,
		{ type = "padding", val = 2 },
		buttons,
		footer,
	},
	opts = {
		margin = 5,
	},
}

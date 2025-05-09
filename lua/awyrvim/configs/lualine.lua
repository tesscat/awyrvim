-- Adapted from https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua as an example

local M = {}

M.options = { section_separators = { left = "", right = "" } }
M.sections = {
	lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
	lualine_b = { "filename", "branch" },
	lualine_c = {
		"%=", --[[ add your center components here in place of this comment ]]
	},
	lualine_x = {},
	lualine_y = { "filetype", "progress" },
	lualine_z = {
		{ "location", separator = { right = "" }, left_padding = 2 },
	},
}
M.inactive_sections = {
	lualine_a = { "filename" },
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = { "location" },
}
M.tabline = {}
M.extensions = {}

return M

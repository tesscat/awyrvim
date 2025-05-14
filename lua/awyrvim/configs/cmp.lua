local M = {}

M.sources = {
	{ name = "path" },
	{ name = "luasnip" },
	{ name = "nvim_lsp" },
	{ name = "buffer" },
}

M.snippet = {
	expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end,
}

M.view = { entries = { name = "custom", selection_order = "near_cursor" } }

local bordered_window = {
	border = "rounded",
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
	zindex = 1001,
	scrolloff = 0,
	col_offset = 0,
	side_padding = 1,
	scrollbar = true,
}

M.window = { completion = bordered_window, documentation = bordered_window }

M.mapping = {
	["<TAB>"] = function()
		require("cmp").confirm({ select = true })
	end,
}

-- M.mapping = cmp.mapping.preset.insert({["<CR>"] = cmp.mapping.confirm({select = true})})

return M

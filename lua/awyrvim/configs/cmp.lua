local M = {}

local cmp = require("cmp")
local luasnip = require("luasnip")

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
	["<CR>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			if luasnip.expandable() then
				luasnip.expand()
			else
				cmp.confirm({
					select = true,
				})
			end
		else
			fallback()
		end
	end),

	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.locally_jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}

-- M.mapping = cmp.mapping.preset.insert({["<CR>"] = cmp.mapping.confirm({select = true})})

return M

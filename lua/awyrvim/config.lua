local function lazyload(path)
	return function()
		return require(path)
	end
end

return {
	leader = "SPC",
	localleader = "\\",
	colourscheme = "dracula",
	builtin = {
		plugins = require("awyrvim.plugins"),
	},
	configs = {
		alpha = lazyload("awyrvim.configs.alpha"),
		cmp = lazyload("awyrvim.configs.cmp"),
		telescope = lazyload("awyrvim.configs.telescope"),
		treesitter = lazyload("awyrvim.configs.treesitter"),
		nvimtree = lazyload("awyrvim.configs.nvimtree"),
		whichkey = lazyload("awyrvim.configs.whichkey"),
		comment = lazyload("awyrvim.configs.comment"),
		lualine = lazyload("awyrvim.configs.lualine"),
		navic = lazyload("awyrvim.configs.navic"),
		bufferline = lazyload("awyrvim.configs.bufferline"),
		dap = lazyload("awyrvim.configs.dap"),
		dapui = lazyload("awyrvim.configs.dapui"),
		neotest = lazyload("awyrvim.configs.neotest"),
		toggleterm = lazyload("awyrvim.configs.toggleterm"),
		illuminate = lazyload("awyrvim.configs.illuminate"),
		indentblankline = lazyload("awyrvim.configs.indentblankline"),
	},
	custom = {
		plugins = {},
	},
}

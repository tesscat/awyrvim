-- TODO: if i use opts = AwyrVim.configs.whatever, does this resolve at table initialisation (bad!) or when LazySync (better)
-- and then figure out if I can actually use opts

local function get_config_for_plugin(plugin)
	return function()
		local cfg = AwyrVim.custom.configs[plugin]
		local cfg_type = type(cfg)
		if cfg_type == "table" then
			return cfg
		end
		local default = require("awyrvim.configs." .. plugin)

		return (cfg and cfg(default)) or default
	end
end

return {
	{ "folke/lazy.nvim", tag = "stable" },
	{ "neovim/nvim-lspconfig", lazy = false },
	{ "lewis6991/hover.nvim", lazy = true, opts = get_config_for_plugin("hover") },
	{ "mason-org/mason.nvim", lazy = false, opts = get_config_for_plugin("mason") },
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
		cmd = { "LspInstall", "LspUninstall" },
		dependencies = { "mason-org/mason.nvim" },
	},
	{ "Tastyep/structlog.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		dependencies = { "telescope-fzf-native.nvim" },
		opts = get_config_for_plugin("telescope"),
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_VERSION_POLICY_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = get_config_for_plugin("cmp"),
		event = { "InsertEnter", "CmdlineEnter" },
		lazy = true,
		dependencies = { "cmp-nvim-lsp", "cmp_luasnip", "cmp-buffer", "cmp-path" },
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		cmd = {
			"TSInstall",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSInstallInfo",
			"TSInstallSync",
			"TSInstallFromGrammar",
		},
		event = "User FileOpened",
		opts = get_config_for_plugin("treesitter"),
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-web-devicons",
		},
		opts = get_config_for_plugin("nvimtree"),
		cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
		event = "User DirOpened",
	},
	-- TODO: maybe a file explorer like lir.nvim or rnvimr
	-- TODO: maybe gitsigns
	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = "WhichKey",
		opts = get_config_for_plugin("whichkey"),
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "User FileOpened",
		opts = get_config_for_plugin("comment"),
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = get_config_for_plugin("lualine"),
	},
	-- TODO: maybe nvim-navbuddy?
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		event = "User FileOpened",
		opts = get_config_for_plugin("navic"),
	},
	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = "User FileOpened",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = get_config_for_plugin("bufferline"),
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		opts = get_config_for_plugin("dap"),
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "nvim-dap", "nvim-nio" },
		opts = get_config_for_plugin("dapui"),
	},
	{ "nvim-neotest/nvim-nio", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "antoinemadec/FixCursorHold.nvim", lazy = true },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-nio",
			"plenary.nvim",
			"nvim-treesitter",
			"FixCursorHold.nvim",
		},
		opts = get_config_for_plugin("neotest"),
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = {
			"ToggleTerm",
			"TermExec",
			"ToggleTermToggleAll",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualLines",
			"ToggleTermSendVisualSelection",
		},
		opts = get_config_for_plugin("toggleterm"),
	},
	{
		"RRethy/vim-illuminate",
		lazy = true,
		opts = get_config_for_plugin("illuminate"),
		event = "User FileOpened",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		opts = get_config_for_plugin("indentblankline"),
		event = "User FileOpened",
	},
	{
		"dracula/vim",
		name = "dracula-colourscheme",
		enabled = function()
			return AwyrVim.colourscheme == "dracula"
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = true,
		opts = get_config_for_plugin("alpha"),
		event = "VimEnter",
	},
}

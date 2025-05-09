-- TODO: if i use opts = AwyrVim.configs.whatever, does this resolve at table initialisation (bad!) or when LazySync (better)
-- and then figure out if I can actually use opts
return {
	{ "folke/lazy.nvim", tag = "stable" },
	{ "neovim/nvim-lspconfig", lazy = true },
	{ "mason-org/mason.nvim", lazy = false },
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
		config = function()
			require("telescope").setup(AwyrVim.configs.telescope())
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_VERSION_POLICY_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup(AwyrVim.configs.cmp())
		end,
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
		config = function()
			require("nvim-treesitter.configs").setup(AwyrVim.configs.treesitter())
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup(AwyrVim.configs.nvimtree())
		end,
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
		config = function()
			require("which-key").setup(AwyrVim.configs.whichkey())
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "User FileOpened",
		config = function()
			require("Comment").setup(AwyrVim.configs.comment())
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup(AwyrVim.configs.lualine())
		end,
	},
	-- TODO: maybe nvim-navbuddy?
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		event = "User FileOpened",
		config = function()
			require("nvim-navic").setup(AwyrVim.configs.navic())
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = true,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup(AwyrVim.configs.bufferline())
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			require("dap").setup(AwyrVim.configs.dap())
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "nvim-dap", "nvim-nio" },
		config = function()
			require("dapui").setup(AwyrVim.configs.dapui())
		end,
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
		config = function()
			require("neotest").setup(AwyrVim.configs.neotest())
		end,
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
		config = function()
			require("toggleterm").setup(AwyrVim.configs.toggleterm())
		end,
	},
	{
		"RRethy/vim-illuminate",
		lazy = true,
		config = function()
			require("illuminate").setup(AwyrVim.configs.illuminate())
		end,
		event = "User FileOpened",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		config = function()
			require("ibl").setup(AwyrVim.configs.indentblankline())
		end,
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
		config = function()
			require("alpha").setup(AwyrVim.configs.alpha())
		end,
		event = "VimEnter",
	},
}

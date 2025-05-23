AwyrVim.custom.keybinds.normal_mode = {
	{ "<leader>e", ":NvimTreeFocus<CR>", desc = "Focus NvimTree" },
	{ "<leader>q", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
	{ "<C-/>", ":ToggleTerm direction=float<CR>", desc = "ToggleTerm floaty" },
}

AwyrVim.custom.keybinds.term_mode = {
	{
		"<C-/>",
		function()
			vim.cmd(":ToggleTerm direction=float<CR>")
		end,
		desc = "ToggleTerm floaty",
	},
}

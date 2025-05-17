AwyrVim.custom.keybinds.normal_mode["<leader>e"] = ":NvimTreeFocus<CR>"
AwyrVim.custom.keybinds.normal_mode["<leader>q"] = ":NvimTreeToggle<CR>"
AwyrVim.custom.keybinds.normal_mode["<C-/>"] = ":ToggleTerm direction=float<CR>"
AwyrVim.custom.keybinds.term_mode["<C-/>"] = function()
	vim.cmd(":ToggleTerm direction=float<CR>")
end

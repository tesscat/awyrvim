require("awyrvim.utils")

AwyrVim = require("awyrvim.config")

require("custom")

vim.g.mapleader = AwyrVim.leader
vim.g.maplocalleader = AwyrVim.localleader
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.o.shiftwidth = AwyrVim.tabsize
vim.o.expandtab = AwyrVim.expandtab

-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
	pattern = "*",
	command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

require("awyrvim.bootstrap")

pcall(vim.cmd("colorscheme " .. AwyrVim.colourscheme))

require("awyrvim.keybinds")

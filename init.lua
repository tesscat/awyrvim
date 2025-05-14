require("awyrvim.utils")

AwyrVim = require("awyrvim.config")

require("custom")

vim.g.mapleader = AwyrVim.leader
vim.g.maplocalleader = AwyrVim.localleader

require("awyrvim.bootstrap")

pcall(vim.cmd("colorscheme " .. AwyrVim.colourscheme))

require("awyrvim.keybinds")

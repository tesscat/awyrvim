AwyrVim.custom.plugins = require("custom.plugins")

vim.list_extend(AwyrVim.configs.cmp().sources, { { name = "lazydev" } })

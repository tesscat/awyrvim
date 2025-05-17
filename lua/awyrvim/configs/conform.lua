local M = {}

M.format_on_save = {
	timeout_ms = 500,
	lsp_format = "fallback",
}

M.formatters_by_ft = {
	astro = { "prettierd" },
	c = { "clang-format" },
	cpp = { "clang-format" },
	cmake = { "gersemi" },
	css = { "prettierd" },
	glsl = { lsp_format = "first" },
	graphql = { "prettierd" },
	haskell = { "fourmolu" },
	h = { "clang-format" },
	hpp = { "clang-format" },
	html = { "prettierd" },
	javascript = { "prettierd" },
	javascriptreact = { "prettierd" },
	json = { "prettierd" },
	jsonc = { "prettierd" },
	kotlin = { "ktfmt" },
	latex = { "latexindent" },
	liquid = { "prettierd" },
	lua = { "stylua" },
	markdown = { "prettierd" },
	mdx = { "prettierd" },
	nix = { "alejandra" },
	-- pest = { "pestfmt" }, -- NOTE: Disabling b/c formatter SUCKS
	python = { "isort", "black" },
	rust = { "rustfmt" },
	sass = { "prettierd" },
	scss = { "prettierd" },
	sql = { "sqlfluff" },
	svelte = { "prettierd" },
	toml = { "taplo" },
	tex = { "latexindent" },
	typescript = { "prettierd" },
	typescriptreact = { "prettierd" },
	yaml = { "prettierd" },
}

return M

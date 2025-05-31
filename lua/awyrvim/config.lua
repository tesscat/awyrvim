local function lazyload(path)
	return function()
		return require(path)
	end
end

return {
	leader = " ",
	tabsize = 4,
	expandtab = true,
	localleader = "\\",
	colourscheme = "catppuccin",
	builtin = {
		plugins = require("awyrvim.plugins"),
		keybinds = {
			insert_mode = {
				-- Move current line / block with Alt-j/k ala vscode.
				{ "<A-j>", "<Esc>:m .+1<CR>==gi" },
				-- Move current line / block with Alt-j/k ala vscode.
				{ "<A-k>", "<Esc>:m .-2<CR>==gi" },
				-- navigation
				{ "<A-Up>", "<C-\\><C-N><C-w>k" },
				{ "<A-Down>", "<C-\\><C-N><C-w>j" },
				{ "<A-Left>", "<C-\\><C-N><C-w>h" },
				{ "<A-Right>", "<C-\\><C-N><C-w>l" },
			},

			normal_mode = {
				-- Better window movement
				{ "<C-h>", "<C-w>h" },
				{ "<C-j>", "<C-w>j" },
				{ "<C-k>", "<C-w>k" },
				{ "<C-l>", "<C-w>l" },

				-- Resize with arrows
				{ "<C-Up>", ":resize -2<CR>" },
				{ "<C-Down>", ":resize +2<CR>" },
				{ "<C-Left>", ":vertical resize -2<CR>" },
				{ "<C-Right>", ":vertical resize +2<CR>" },

				-- Move current line / block with Alt-j/k a la vscode.
				{ "<A-j>", ":m .+1<CR>==" },
				{ "<A-k>", ":m .-2<CR>==" },
				{
					"<leader>lf",
					function()
						require("conform").format({ async = true })
					end,
					desc = "Run conform.nvim formatting",
				},
				{ "<leader>f", group = "Telescope" },
				{ "<leader>fp", ":Telescope pickers<CR>", desc = "Find finders" },
				{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find open buffer" },
				{ "<leader>ff", ":Telescope find_files<CR>", desc = "Find file" },
				{ "<leader>fe", ":Telescope symbols<CR>", desc = "Find emoji" },
				{ "<leader>fw", ":Telescope live_grep<CR>", desc = "Find words" },
				{ "<leader>fd", ":Telescope diagnostics<CR>", desc = "Find diagnostics" },
				{ "<leader>fl", group = "Telescope language" },
				{ "<leader>fls", ":Telescope lsp_workspace_symbols<CR>", desc = "Find symbols" },
				{ "<leader>flq", ":Telescope quickfix<CR>", desc = "Find quickfixes" },
				{ "<leader>flr", ":Telescope lsp_references<CR>", desc = "Find references" },
				{ "<leader>fli", ":Telescope lsp_implementations<CR>", desc = "Find implementations" },
				{ "<leader>flo", ":Telescope lsp_outgoing_calls<CR>", desc = "Find outgoing calls" },
				{ "<leader>fld", ":Telescope lsp_definitions<CR>", desc = "Find definitions" },
				{ "<leader>fg", group = "Telescope git" },
				{ "<leader>fgc", ":Telescope git_commits<CR>", desc = "Find git commits" },
				{ "<leader>fgb", ":Telescope git_branches<CR>", desc = "Find git branches" },
				{ "<leader>fgs", ":Telescope git_status<CR>", desc = "Find changed files" },
				{
					"<leader>fgr",
					":Telescope git_bcommits_range<CR>",
					desc = "Find commits affecting a range of lines",
				},
				{ "<leader>fgt", ":Telescope git_bcommits<CR>", desc = "Find commits affecting this buffer" },

				{ "<leader>l", group = "Language" },

				{
					"<leader>lr",
					function()
						vim.lsp.buf.rename()
					end,
					desc = "LSP rename",
				},
				{
					"<leader>la",
					function()
						vim.lsp.buf.code_action()
					end,
					desc = "LSP code action",
				},
			},

			term_mode = {
				-- Terminal window navigation
				{ "<C-h>", "<C-\\><C-N><C-w>h" },
				{ "<C-j>", "<C-\\><C-N><C-w>j" },
				{ "<C-k>", "<C-\\><C-N><C-w>k" },
				{ "<C-l>", "<C-\\><C-N><C-w>l" },
			},

			visual_mode = {
				-- Better indenting
				{ "<", "<gv" },
				{ ">", ">gv" },
			},

			visual_block_mode = {
				-- Move current line / block with Alt-j/k ala vscode.
				{ "<A-j>", ":m '>+1<CR>gv-gv" },
				{ "<A-k>", ":m '<-2<CR>gv-gv" },
			},

			command_mode = {
				-- navigate tab completion with <c-j> and <c-k>
				-- runs conditionally
				{ "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', expr = true, noremap = true },
				{ "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', expr = true, noremap = true },
			},
		},
	},
	custom = {
		plugins = {},
		configs = {},
		keybinds = {
			insert_mode = {},

			normal_mode = {},

			term_mode = {},

			visual_mode = {},

			visual_block_mode = {},

			command_mode = {},
		},
	},
}

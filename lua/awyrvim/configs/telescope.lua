local M = {}
M.extensions = {
	["ui-select"] = {
		require("telescope.themes").get_dropdown({
			-- even more opts
		}),
	},
}
return M

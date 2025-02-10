return {
	"lewis6991/gitsigns.nvim",
	opts = {},
	config = function(plugin, opts)
		local gitsigns = require("gitsigns")
		gitsigns.setup(opts)
		vim.keymap.set("n", "<leader>rh", gitsigns.reset_hunk)
		vim.keymap.set("n", "<leader>gb", gitsigns.blame)
		vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
	end
}

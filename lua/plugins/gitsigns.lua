return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	opts = {},
	config = function(_, opts)
		local gitsigns = require("gitsigns")
		gitsigns.setup(opts)
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
		vim.keymap.set("n", "<leader>bl", gitsigns.blame)
	end,
}

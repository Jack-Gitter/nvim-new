return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua", },
	opts = {
		kind = "floating",
		commit_editor = {
			kind = "floating",
			show_staged_diff = false,
		}
	},
	config = function(_, opts)
		local neogit = require("neogit")
		neogit.setup(opts)
		vim.keymap.set("n", "<leader>git", function() neogit.open({ kind = "floating" }) end)
	end
}

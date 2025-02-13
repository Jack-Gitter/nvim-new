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
		},
		commit_select_view = {
			kind = "floating",
		},
		commit_view = {
			kind = "floating",
			verify_commit = vim.fn.executable("gpg") == 1,
		},
		popup = {
			kind = "floating",
		},
		log_view = {
			kind = "floating",
		},
		mappings = {
			popup = {
				["w"] = false
			}
		}
	},
	config = function(_, opts)
		local neogit = require("neogit")
		neogit.setup(opts)
		vim.keymap.set("n", "<leader>git", function() neogit.open() end)
		vim.keymap.set("n", "<leader>gc", function() neogit.open({ "commit" }) end)
	end
}

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup()
		vim.keymap.set("n", "<leader>git", function() neogit.open({ kind = "floating" }) end)
		vim.api.nvim_create_autocmd({ "NeogitPushComplete" }, {
			pattern = "*",
			callback = function()
				print("done!")
			end
		})
	end
}

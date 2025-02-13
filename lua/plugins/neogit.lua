return {
	"NeogitOrg/neogit",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"sindrets/diffview.nvim",
			config = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = "DiffviewFiles",
					callback = function()
						vim.keymap.set("n", "<esc>", ":DiffviewClose<cr>", { buffer = true })
					end
				})
			end
		},
		{ "ibhagwan/fzf-lua" },
	},
	opts = {
		kind = "floating",
		commit_editor = {
			kind = "floating",
			show_staged_diff = false,
		},
		commit_select_view = {
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
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "NeogitStatus",
			callback = function()
				vim.keymap.set("n", "<esc>", ":bd<cr>", { buffer = true })
			end
		})
	end
}

return {
	"stevearc/oil.nvim",
	keys = { "<leader>o" },
	opts = {
		keymaps = {
			["b"] = { "actions.parent", mode = "n" },
			["<esc>"] = { "actions.close", mode = "n" },
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function(_, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>")
	end,
}

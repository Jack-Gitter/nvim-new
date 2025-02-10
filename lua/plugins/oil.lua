return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["b"] = { "actions.parent", mode = "n" },
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function(plugin, opts)
		require("oil").setup(opts)
		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>")
	end,
}

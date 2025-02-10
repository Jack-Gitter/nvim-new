return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"hrsh7th/cmp-buffer"
		},
		{
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	opts = {
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" }
		},
	},
	config = function(_, opts)
		local cmp = require("cmp")
		opts.mapping = {
			["<C-j>"] = function() cmp.select_next_item() end,
			["<C-k>"] = function() cmp.select_prev_item() end,
			["<C-CR>"] = function() cmp.confirm() end,
		}
		cmp.setup(opts)
	end,
}

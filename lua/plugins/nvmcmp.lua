return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"hrsh7th/cmp-buffer"
		},
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"L3MON4D3/LuaSnip",
		},
	},
	opts = {
		snippet = {
			expand = function(args) require("luasnip").lsp_expand(args.body) end
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = 'luasnip' },
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

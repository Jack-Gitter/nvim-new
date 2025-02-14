return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"LuaSnip",
		},
		{
			"hrsh7th/cmp-buffer",
		},
		{
			"saadparwaiz1/cmp_luasnip"
		},
		{
			"hrsh7th/cmp-nvim-lua"
		}
	},
	opts = {
		snippet = {
			expand = function(args) require("luasnip").lsp_expand(args.body) end
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = 'luasnip' },
			{ name = 'nvim_lua' },
			{ name = "buffer" }
		},
	},
	config = function(_, opts)
		local cmp = require("cmp")
		opts.mapping = {
			["<C-j>"] = cmp.select_next_item,
			["<C-k>"] = cmp.select_prev_item(),
			["<C-CR>"] = cmp.confirm(),
		}
		cmp.setup(opts)
	end,
}

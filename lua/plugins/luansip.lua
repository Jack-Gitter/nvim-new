return {
	"L3MON4D3/LuaSnip",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },
		highlight = {
			enable = true
		}
	},
	lazy = true
}

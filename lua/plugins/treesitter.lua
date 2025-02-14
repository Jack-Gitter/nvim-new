return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript", "html", "hcl" },
		highlight = {
			enable = true
		}
	},
	event = { "BufReadPost", "BufNewFile" },
}

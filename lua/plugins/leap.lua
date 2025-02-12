return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	config = function()
		vim.keymap.set('n', 'f', '<Plug>(leap-forward)')
		vim.keymap.set('n', 'F', '<Plug>(leap-backward)')
	end
}

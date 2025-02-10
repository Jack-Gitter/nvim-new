return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	opts = {
		keymap = {
			preset = 'default',
			["<C-j>"] = { 'select_next', 'fallback' },
			["<C-k>"] = { 'select_prev', 'fallback' },
			["<C-CR>"] = { 'select_and_accept', 'fallback' }
		},
	},
}

vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
			[vim.diagnostic.severity.INFO] = 'InfoMsg',
			[vim.diagnostic.severity.HINT] = 'HintMsg',
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
			[vim.diagnostic.severity.INFO] = 'InfoMsg',
			[vim.diagnostic.severity.HINT] = 'HintMsg',
		},
	},
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

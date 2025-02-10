local on_attach = function()
	local gitsigns = require("gitsigns")
	vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { buffer = 0 })
	vim.keymap.set("n", "<leader>gb", gitsigns.blame, { buffer = 0 })
	vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
end

return { "lewis6991/gitsigns.nvim", opts = { on_attach = on_attach } }

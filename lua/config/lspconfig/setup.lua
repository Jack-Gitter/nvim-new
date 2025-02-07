local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function()
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0})
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {buffer = 0})
	vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, {buffer = 0})
end

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {diagnostics = { globals = { 'vim' }}}
	}
})

lspconfig.ts_ls.setup({capabilities = capabilities, on_attach = on_attach})

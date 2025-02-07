local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {diagnostics = { globals = { 'vim' }}}
	}
})

lspconfig.ts_ls.setup({capabilities = capabilities})

local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(client)
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = 0 })
	if client.supports_method("textDocument/format") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format()
			end
		})
	end
end

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = { diagnostics = { globals = { 'vim' } } }
	}
})

lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.eslint.setup({ capabilities = capabilities, on_attach = on_attach })

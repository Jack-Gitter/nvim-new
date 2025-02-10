local on_attach = function(client, bufnr)
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = 0 })
	if client.supports_method("textDocument/format") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
			end
		})
	end
end


return {
	"neovim/nvim-lspconfig",
	opts = {},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = { diagnostics = { globals = { 'vim' } } }
			}
		})

		lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
		lspconfig.eslint.setup({ capabilities = capabilities, on_attach = on_attach })
	end
}

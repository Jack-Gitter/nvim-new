return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason.nvim",
		},
		{
			"mason-lspconfig.nvim",
		},
		{
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	opts = {},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>ho", vim.lsp.buf.hover, { buffer = true })
			if client.supports_method("textDocument/format") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
						vim.diagnostic.enable()
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

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				completions = {
					completeFunctionCalls = true
				}
			},
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				completions = {
					completeFunctionCalls = true
				}
			},
		})

	end,
	event = { "BufReadPost", "BufNewFile" },
}

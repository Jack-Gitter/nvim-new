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
            local augroup = vim.api.nvim_create_augroup("LSP", {})
            vim.keymap.set("n", "<leader>ho", vim.lsp.buf.hover, { buffer = true })
            if client.supports_method("textDocument/formatting") and vim.bo.filetype ~= "python" then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                        if vim.bo.filetype == "lua" then
                            vim.diagnostic.enable()
                        end
                    end
                })
            end
            if client.supports_method("textDocument/signatureHelp") then
                vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
                    pattern = "*",
                    group = augroup,
                    callback = function()
                        vim.lsp.buf.signature_help()
                    end,
                })
            end
        end

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = "Disable",
                        ignoreDir = { "~/.local/" },
                    },
                    diagnostics = {
                        libraryFiles = "Disable",
                        globals = { 'vim' }
                    }
                }
            }
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                gopls = {
                    symbolScope = "workspace",
                }
            },
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach
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
    end,
    event = { "BufReadPost", "BufNewFile" },
}

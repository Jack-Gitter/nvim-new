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
            "mason-nvim-dap.nvim"
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
            local ft = vim.bo.filetype
            if client.supports_method("textDocument/formatting") and (ft ~= "python" or ft ~= "javascript" or ft ~= "typescript") then
                vim.api.nvim_create_autocmd("BufWritePre", {
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
                vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { noremap = true })
                vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
                    buffer = bufnr,
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

        lspconfig.eslint.setup({
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
}

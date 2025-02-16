return { -- LSP Configuration & Plugins
    'williamboman/mason.nvim',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason-lspconfig.nvim',
        -- Useful status updates for LSP
        'j-hui/fidget.nvim',
    },
    config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {"pyright","lua_ls","jdtls","ts_ls","html","cssls","cmake","jsonls","emmet_ls","clangd","yamlls",} })

            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers({
                function(server)
                    if server == "lua_ls" then
                        lspconfig[server].setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    telemetry = {
                                        enable = false,
                                    },
                                    workspace = {
                                        library = {
                                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                            [vim.fn.expand("$VIMRUNTIME/lua/vim")] = true,
                                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                        },
                                    },
                                },
                            },
                        })

                    else
                        lspconfig[server].setup({})
                    end
                end,
            })
        end
    }

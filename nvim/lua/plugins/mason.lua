return { -- LSP Configuration & Plugins
	"williamboman/mason.nvim",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason-lspconfig.nvim",
		-- Useful status updates for LSP
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"pylsp",
				"bashls",
				"lua_ls",
				"jdtls",
				"ts_ls",
				"html",
				"cssls",
				"cmake",
				"jsonls",
				"emmet_ls",
				"clangd",
				"yamlls",
			},
		})
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
				elseif server == "pylsp" then
					lspconfig[server].setup({
						settings = {
							pylsp = {
								plugins = {
									pyflakes = { enable = false },
									pycodestyle = { enable = false },
									autopep8 = { enable = false },
									yapf = { enable = false },
									mccabe = { enable = false },
									pylsp_mypy = { enable = false },
									pylsp_black = { enable = false },
									pylsp_isort = { enable = false },
								},
							},
						},
					})
				else
					lspconfig[server].setup({})
				end
			end,
		})
	end,
}

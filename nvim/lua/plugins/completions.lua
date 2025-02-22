return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menuone,noinsert,noselect",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-o>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
					{ "i", "c" }
				),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
				["<C-l>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "nvim_lua" },
			}, {}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline({ ":" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
			},
		})
	end,
}

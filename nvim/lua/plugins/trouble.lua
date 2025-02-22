return { --language diagnostics
	"folke/trouble.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"<leader>xt",
			"<cmd>TodoTrouble<cr>",
			desc = "open todos (Trouble)",
		},
	},

	config = function()
		require("trouble").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}

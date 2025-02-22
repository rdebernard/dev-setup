return { --replace nvim  UI
	"folke/noice.nvim",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- add any options here
			routes = {
				{
					filter = {
						event = "lsp",
						kind = "progress",
					},
					opts = { skip = true },
				},
			},
		})
	end,
}

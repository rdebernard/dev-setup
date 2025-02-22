return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("dashboard")
		local api = vim.api
		local keymap = vim.keymap

		local conf = {}
		conf.header = {
			"                                                       ",
			"                                                       ",
			"                                                       ",
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"                                                       ",
			"                                                       ",
			"                                                       ",
			"                                                       ",
		}

		conf.center = {
			{
				icon = "  ",
				desc = "Find File                               ",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = "  ",
				desc = "New file                                ",
				action = "enew",
				key = "e",
			},
			{
				icon = "  ",
				desc = "Recent Files                            ",
				action = "Telescope oldfiles",
				key = "r",
			},
			{
				icon = "  ",
				desc = "Find Text                               ",
				action = "Telescope live_grep",
				key = "g",
			},
			{
				icon = "󰒲  ",
				desc = "Lazy                                    ",
				action = "Lazy",
				key = "l",
			},
			{
				icon = "  ",
				desc = "Quit Nvim                               ",
				action = "qa",
				key = "q",
			},
		}

		dashboard.setup({
			theme = "doom",
			shortcut_type = "number",
			config = conf,
		})

		api.nvim_create_autocmd("FileType", {
			pattern = "dashboard",
			group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
			callback = function()
				keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
				keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
			end,
		})
	end,
}

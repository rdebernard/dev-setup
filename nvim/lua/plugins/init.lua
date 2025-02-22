return {
	"christoomey/vim-tmux-navigator", --easier nvim and tmux navigation
	"rafamadriz/friendly-snippets", --snippets for multiple programming languages
	"nvim-lua/plenary.nvim", --lua functions that many plugins use
	{
		"MeanderingProgrammer/markdown.nvim", --markdown
		main = "render-markdown",
		opts = {},
		name = "render-markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{ --note taking plugin
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"tpope/vim-obsession", --vim session manager
	{ --file explor
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"ThePrimeagen/harpoon", --better buffer list
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"iamcco/markdown-preview.nvim", --markdown preview
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"tpope/vim-surround", --better mapping for working with brackets,quotes,etc
	{
		"folke/todo-comments.nvim", --todo comment
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"rcarriga/nvim-notify", --notification manager for neovim
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = false,
			})
		end,
	},
	{ "catppuccin/nvim", as = "catppuccin" }, --colorschemes
	{
		"folke/tokyonight.nvim", --colorschemes
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({ transparent = vim.g.transparent_enabled })
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"rcarriga/nvim-dap-ui", --dapper ui for debugging
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",

	-- Git related plugins
	"tpope/vim-fugitive",
	-- Better f navigation
	"unblevable/quick-scope",
}

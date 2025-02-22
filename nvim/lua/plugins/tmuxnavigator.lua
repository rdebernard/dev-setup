return {
	--easier nvim and tmux navigation
	"christoomey/vim-tmux-navigator",
	config = function()
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap

		keymap("n", "<c-h>", ":TmuxNavigateLeft <cr>", opts)
		keymap("n", "<c-j>", ":TmuxNavigateDown <cr>", opts)
		keymap("n", "<c-k>", ":TmuxNavigateUp <cr>", opts)
		keymap("n", "<c-l>", ":TmuxNavigateRight <cr>", opts)
	end,
}

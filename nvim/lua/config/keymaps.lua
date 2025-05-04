local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- better esc
keymap("i", "jk", "<ESC>", opts)

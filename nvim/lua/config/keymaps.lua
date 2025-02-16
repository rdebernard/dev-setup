vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- splits 
keymap("n", "<leader>s-", ":resize -5<cr>", opts)
keymap("n", "<leader>s+", ":resize +5<cr>", opts)
keymap("n", "<leader>s_", ":vertical resize -5<CR>", opts)
keymap("n", "<leader>s=", ":vertical resize +5<CR>", opts)
keymap("n", "<leader>ss", "<C-w>s<cr>", opts)
keymap("n", "<leader>sv", "<C-w>v<cr>", opts)
keymap("n", "<leader>sw", "<C-w>w", opts)
keymap("n", "<leader>sx", "<C-w>x", opts)

-- quit
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<leader>Q", ":qa<cr>", opts)

-- save
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>W", ":wall<cr>", opts)

-- buffers
keymap("n", "<leader>bl", ":blast<cr>", {noremap=false})
keymap("n", "<leader>bf", ":bfirst<cr>", {noremap=false})
keymap("n", "<leader>bp", ":bprev<cr>", {noremap=false})
keymap("n", "<leader>bn", ":bnext<cr>", {noremap=false})
keymap("n", "<leader>bd", ":bdelete<cr>", {noremap=false})

-- better esc
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

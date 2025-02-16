return {
    "nvim-tree/nvim-tree.lua", --file explor
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
      })
      vim.keymap.set("n","<leader>ee",":NvimTreeToggle<CR>", {desc = "Toggle tree"})
      vim.keymap.set("n","<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
      vim.keymap.set("n","<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
      vim.keymap.set("n","<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end,
  }


return {
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  config = function ()
    require("lualine").setup{
      options = {
        icons_enabled = true,
        theme = 'tokyonight-night',
      },
    }

  end
}

  return {
    "windwp/nvim-autopairs",                          --work with pairs such as bracket ,etc
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup(
      {
        enable_check_bracket_line = false
      }
      )
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end
  }

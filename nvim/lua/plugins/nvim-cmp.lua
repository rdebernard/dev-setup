return { -- Autocompletion
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-cmdline",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.preselect = cmp.PreselectMode.None
    opts.completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    }
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    })

    cmp.setup.cmdline({ ":" }, {
      preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone,noselect" },
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping(
          cmp.mapping.confirm({
            select = false,
          }),
          { "c", "i" }
        ),
      }),
      sources = {
        { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
      },
    })
  end,
}

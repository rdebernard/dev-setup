  return { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',

    },
    config = function ()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          completeopt = "menu,menuone"
        },
        snippet = {
          expand = function(args)
            require"luasnip".lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-o>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-y>'] = cmp.mapping(
            cmp.mapping.confirm{
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            {"i", "c"}
          ),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = "luasnip" },
          { name = "path"},
          { name = "buffer", keyword_length = 3},
          { name = "nvim_lua"},
          }, { }),
      })

      cmp.setup.cmdline({"/","?"},{
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {name = "buffer"},
        }
      })

      cmp.setup.cmdline({":"},{
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {name = "buffer"},
          {name = "path"},
          {name = "cmdline", option = {ignore_cmds = {"Man","!"}}}
        }
      })
     end
   }

return  { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- Useful status updates for LSP
  'j-hui/fidget.nvim',
  },
  config = function ()
    local lspconfig = require('lspconfig')

    lspconfig.ccls.setup {
      compilationDatabaseDirectory = "build";
      index = {
      threads = 0;
    };
    clang = {
      excludeArgs = {"-frounding-math"};
    };
    }

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    --vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>aw', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>rw', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>lw', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>=', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
    })
  end
}

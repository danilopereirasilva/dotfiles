return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "jdtls",
          "basedpyright",
          "ruff",
          "phptools",
          "vimls",
          "markdown-oxide",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method('textDocument/implementation') then
            -- lsp shotcuts
            -- Create a keymap for vim.lsp.buf.implementation ...
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'Go to references' })
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.type_definition, { desc = 'Go to definitions' })
            vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'Go to implementations' })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
            vim.keymap.set('n', '<leader>ss', vim.lsp.buf.workspace_symbol, { desc = 'Show symbols' })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
          end
          -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
          if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
          end
          -- Auto-format ("lint") on save.
          -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
          if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end
}
}

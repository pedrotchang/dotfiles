return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers_to_enable = {}

      -- Only enable LSP servers if their binaries are available
      if vim.fn.executable('lua-language-server') == 1 then
        vim.lsp.config('lua_ls', { capabilities = capabilities })
        table.insert(servers_to_enable, 'lua_ls')
      end

      if vim.fn.executable('ruff') == 1 then
        vim.lsp.config('ruff', { capabilities = capabilities })
        table.insert(servers_to_enable, 'ruff')
      end

      if #servers_to_enable > 0 then
        vim.lsp.enable(servers_to_enable)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if c:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  }
}

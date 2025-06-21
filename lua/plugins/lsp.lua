return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "mason-org/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },

    config = function()
      require("mason").setup({})
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
        automatic_installation = false,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({ capabilities = capabilities })
          end,
        },
      })

      --[[
      require('lspconfig').lua_ls.setup({ capabilities = capabilities })
      require('lspconfig').clangd.setup({ capabilities = capabilities })
      ]] --
      require('fidget').setup({})



      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
            vim.keymap.set('n', 'gd', function()
              vim.lsp.buf.implementation({ bufnr = args.buf, id = client.id })
            end, { buffer = args.buf, desc = 'Go to implementation' })
          end

          if client:supports_method('textDocument/completion') then
            --vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end

          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,

        vim.diagnostic.config({ virtual_text = true })
      })
    end,
  }
}

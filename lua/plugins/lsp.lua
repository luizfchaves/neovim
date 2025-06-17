return {
  {
    "nvim-treesitter/nvim-treesitter",
		run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
	},
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
	  "dundalek/lazy-lsp.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
		},
		config = function()
			local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")
      
      lsp_zero.on_attach(function(client, bufnr)
			  -- see :help lsp-zero-keybindings to learn the available actions
			  lsp_zero.default_keymaps({
			    buffer = bufnr,
				  preserve_mappings = false
		    })
		  end)

      lsp_zero.setup_servers({'ts_ls'})
      lspconfig.eslint.setup({
        cmd = { "/home/donan/.nvm/versions/node/v20.18.3/bin/vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "html" },
        settings = {},
        on_attach = function(client, bufnr)
          lsp_zero.on_attach(client, bufnr)
        end,
        capabilities = lsp_zero.get_capabilities(),
      })

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Esc>'] = cmp.mapping.abort(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }
      })
    end,
  },
}

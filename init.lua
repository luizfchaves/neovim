require("config.lazy")

-- BASIC CONFIG:
vim.opt.relativenumber = true
vim.opt.timeoutlen = 500
vim.opt.encoding = 'UTF-8'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "json", "html", "css" }, -- Add other languages you use
  highlight = {
    enable = true,
    -- disable = { "javascript" }, -- uncomment to disable for a language
    -- additional_vim_regex_highlighting = false,
  },
  -- Add other modules like indent if you want
  indent = { enable = true },
}
local lspconfig = require('lspconfig')
lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  
  settings = {
    eslint = {
      -- Example settings for ESLint itself
      -- enable = true,
      codeActionOnSave = { enable = true, mode = "all" },
      -- format = true,
    }
  }
}


-- Keymaps:
vim.keymap.set('n', '<leader>r', '',
	{
    desc = "Open file explorer [Ranger]",
	  noremap = true,
    callback = function()
      require("ranger-nvim").open(true)
    end,
  }
)

vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>',
	{ desc = "Open file fuzzy finder [Telescope]" }
)

vim.keymap.set('n', '<leader>F',
  function()
    require('telescope.builtin').live_grep({
      additional_args = { '--glob', '!*.json' }
    })
  end,
	{ desc = "Open content fuzzy finder [Telescope]"}
)
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<cr>',
  { desc = "Open outline windows [Aerial]" }
)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
  { desc = "Code Actions [LSP]",buffer = bufnr }
)
-- In your Neovim configuration, you can map a keybind to trigger code actions
-- and configure automatic application
vim.keymap.set('n', '<Tab>',
  function()
    vim.lsp.buf.code_action({
      apply = true, -- Automatically apply if only one action is available
    })
  end,
  { desc = "Open Code Actions [LSP]" }
)
--[[
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
]]--
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

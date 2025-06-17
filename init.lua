require("config.lazy")

-- BASIC CONFIG:
vim.opt.relativenumber = true
vim.opt.timeoutlen = 250
vim.opt.encoding = 'UTF-8'
vim.opt.tabstop = 2

-- Basic keymaps:
vim.keymap.set('n', '<leader>r', '', {
  desc = "Open file explorer [Ranger]",
	noremap = true,
	callback = function()
    require("ranger-nvim").open(true)
  end,
})
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>',{
  desc = "Open fuzzy finder [Telescope]"
})
vim.keymap.set('n', '<leader>f', '<cmd>AerialToggle<cr>',{
  desc = "Open outline windows [Aerial]"
})

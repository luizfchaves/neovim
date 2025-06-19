require("config.lazy")
vim.cmd("helptags ~/.config/nvim/doc")

--- OPTS
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

--- KEYMAPS
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
vim.keymap.set("n", "<leader>/", ":help myhelp<CR>")
vim.keymap.set("v", "//", [[y/\V<C-r>=escape(@",'/\')<CR><CR>]], { desc = "Search selected text" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",
  { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",
  { desc = "Move line up" })

--- GODDIES (TJ)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('kicstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- terminal stuff
local job_id = 0
vim.keymap.set("n", "<leader>tc", "<cmd>lua vim.cmd('q')<CR>",
  { desc = "Close terminal" })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>",
  { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>ts", function()
  local cwd = vim.fn.expand('%:p')
  vim.cmd.vnew()
  vim.cmd.terminal()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  job_id = vim.bo.channel

  cwd = cwd:match("(.*/)")

  vim.fn.chansend(job_id, { "cd ", cwd, "\r\n" })
  vim.fn.chansend(job_id, { "clear\r\n" })
  vim.cmd.startinsert()
end, { desc = "Open a small terminal n the botton" })

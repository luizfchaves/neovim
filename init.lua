--vim.g.ai_assistant = "copilot"
vim.g.ai_assistant = "supermaven"
require("config.lazy")
local keymap = require("config.keymap")
vim.cmd("helptags ~/.config/nvim/doc")

--- OPTS
vim.o.encoding = "utf-8"
vim.o.ttimeoutlen = 0
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10

--- Keymaps
keymap.set("Source current file", "<leader><leader>x", "<cmd>source %<CR>")
keymap.set("Source current line as lua", "<leader>x", ":.lua<CR>")
keymap.set("Source selected text as lua", "<leader>x", ":lua<CR>", "v")
keymap.set("Clear search highlights", "<esc>", "<cmd>nohlsearch<CR>")
keymap.set("Quit insert mode", "jj", "<esc>", "i")
keymap.set("Open netrw from current file", "<leader>fl", "<cmd>Explore %:p:h<CR>")

keymap.set("Open help file", "<leader>/", ":help myhelp<CR>")
keymap.set("Search selected text", "//", [[y/\V<C-r>=escape(@",'/\')<CR><CR>]], "v")

keymap.set("Close current buffer", "C-d", "<cmd>bd<CR>")
keymap.set("Move line down", "J", ":m '>+1<CR>gv=gv", "v")
keymap.set("Move line up", "K", ":m '<-2<CR>gv=gv", "v")

--- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('kicstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--- Terminal stuff
local job_id = 0
keymap.set("Close terminal", "<leader>tc", "<cmd>lua vim.cmd('q')<CR>")
keymap.set("Exit terminal mode", "<esc><esc>", "<C-\\><C-n>", "t")
keymap.set("Open a small terminal in the bottom", "<leader>ts", function()
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
end)


-- Disabling arrow keys
-- Disable arrow keys in Normal mode
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Disable arrow keys in Insert mode
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- Disable arrow keys in Visual mode
vim.keymap.set("v", "<Up>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")

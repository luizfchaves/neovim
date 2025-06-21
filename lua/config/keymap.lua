local M = {}

--- Sets a keymap in Neovim.
--- @param description string A description for the keymap.
--- @param combination string The key combination (e.g., "<leader>ff").
--- @param command string|function The command or function to execute.
--- @param mode string|nil The mode(s) for the keymap (e.g., "n" for normal, "v" for visual, "i" for insert). Defaults to "n" if nil.
function M.set(description, combination, command, mode)
  local opts = { desc = description }
  vim.keymap.set(mode or "n", combination, command, opts)
end

-- export
return M

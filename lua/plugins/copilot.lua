local function accept_line(suggestion_function)
  local line = vim.fn.line('.')
  local line_count = vim.fn.line('$')
  suggestion_function()
  local added_lines = vim.fn.line('$') - line_count
  if added_lines > 1 then
    vim.api.nvim_buf_set_lines(0, line, line + added_lines - 1, false, {})
    local last_col = #vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or 0
    vim.api.nvim_win_set_cursor(0, { line, last_col })
  end
end

return {
  {
    "zbirenbaum/copilot.lua",
    enabled = (vim.g.ai_assistant == "copilot"),
    cmd = "Copilot",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        }
      })
      local keymap = require("config.keymap")

      vim.g.copilot_no_tab_map = true
      keymap.set("Accept Copilot Suggestion [One line]", "<S-Tab><S-Tab>",
        function() require("copilot.suggestion").accept_line() end,
        "i")

      keymap.set("Disable Copilot", "<leader>ad", "<cmd>Copilot disable<cr>")
      keymap.set("Enable Copilot", "<leader>ae", "<cmd>Copilot enable<cr>")
      keymap.set("Open Copilot Panel", "<leader>ap", "<cmd>Copilot panel<cr>")
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    enabled = (vim.g.ai_assistant == "supermaven"),
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_line = "<S-Tab><S-Tab>",
        },
        ignore_filetypes = {}, -- or { "cpp", }
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = true,            -- disables built in keymaps for more manual control
        condition = function()
          return false
        end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      })

      vim.keymap.set("i", "<S-Tab><S-Tab>", function()
        local suggestion = require("supermaven-nvim.completion_preview")
        if suggestion.has_suggestion() then
          accept_line(suggestion.on_accept_suggestion)
        else
          -- Fallback to a default action if there's no suggestion
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-l>", true, false, true), "i", false)
        end
      end, { noremap = true, silent = true })
    end,
  }
}

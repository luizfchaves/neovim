return {
  {
    "zbirenbaum/copilot.lua",
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
  }
}

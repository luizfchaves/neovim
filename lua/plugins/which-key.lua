return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      plugins = {
        marks = true,     -- Show marks in which-key
        registers = true, -- Show registers in which-key
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          g = true,
        },
      },
      window = {
        border = "single",        -- 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
        position = "bottom",      -- 'top', 'bottom'
        margin = { 1, 0, 1, 0 },  -- {top, right, bottom, left}
        padding = { 2, 2, 2, 2 }, -- {top, right, bottom, left}
        winblend = 50,            -- Window transparency (0-100)
        zindex = 1000,            -- Z-index of the window
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>f", group = "[F]iles", icon = { icon = "🔎" } },
        { "<leader>l", group = "Lazy git", icon = { icon = "🦑" } },
        { "<leader>a", group = "AI", icon = { icon = "🤖" } },
        { "<leader>h", group = "Harpoon", icon = { icon = "🦯" } },
        { "<leader>t", group = "Terminal", icon = { icon = "🧑‍💻" } },
      })
    end,
  }
}

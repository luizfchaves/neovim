return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width          = 0.99,
              height         = 0.99,
              preview_height = 0.7,
              results_height = 0.2,
            }
            -- other layout configuration here
          },
          -- other defaults configuration here
        },
        extensions = {
          fzf = {}
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
      require("telescope").load_extension("fzf")
      require("config.telescope.multigrep").setup()
      local keymap = require("config.keymap")

      -- desc, command, function
      keymap.set("Tags documentation", "<leader>/f", require('telescope.builtin').help_tags)
      keymap.set("Find by name [Telescope]", "<leader>ff", require('telescope.builtin').find_files)

      keymap.set("Neovim config [Telescope]", "<leader>fc",
        function() require('telescope.builtin').find_files({ cwd = "~/.config/nvim" }) end
      )
    end,
  }
}

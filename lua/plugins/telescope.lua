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
        }
      })
      require("telescope").load_extension("fzf")
      require("config.telescope.multigrep").setup()

      vim.keymap.set('n', "<leader>fh", require('telescope.builtin').help_tags,
        { desc = "Open telescope for tags" })
      vim.keymap.set('n', "<leader>ff", require('telescope.builtin').find_files,
        { desc = "Open telescope for files" })
      vim.keymap.set('n', "<leader>fc", function()
          require('telescope.builtin').find_files({
            cwd = "~/.config/nvim"
          })
        end,
        { desc = "Open telescope for nvim files" })
    end,
  }
}

return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = {
        wrap_results = true,
        layout_strategy = 'vertical',
        layout_config = { height = 0.95, width= 0.95 },
      },
      pickers = {
        -- Your picker-specific configurations...
      },
    }
  end,
}

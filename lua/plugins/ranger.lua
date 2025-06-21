return {
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({})

      local keymap = require("config.keymap")

      keymap.set("Open directory with ranger", "<leader>fr",
        function() require("ranger-nvim").open(true) end
      )
    end,
  }
}

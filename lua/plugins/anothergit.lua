return {
  {
    "airblade/vim-gitgutter",
    init = function()
      vim.g.gitgutter_map_keys = 0 -- Disable default key mappings
      vim.g.gitgutter_sign_added = '➕'
      vim.g.gitgutter_sign_modified = '✏️'
      vim.g.gitgutter_sign_removed = '❌'
      vim.g.gitgutter_sign_modified_removed = '🔄'
    end,
    config = function()
      local keymap = require("config.keymap")

      keymap.set("Preview git diff", "<leader>gg", ":GitGutterPreviewHunk<CR>")
    end,
  }
}

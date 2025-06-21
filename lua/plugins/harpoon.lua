return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- The base for harpoon will be <leader>h
      local harpoon = require("harpoon")
      harpoon:setup()

      -- HARPOON WITH TELESCOPE
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      -- HARPOON KEYMAPS
      local keymap = require("config.keymap")

      keymap.set("Open harpoon window", "<leader>hw",
        function() toggle_telescope(harpoon:list()) end
      )
      keymap.set("Harpoon: Previous file", "J",
        function() harpoon:list():prev() end
      )
      keymap.set("Harpoon: Next file", "K",
        function() harpoon:list():next() end
      )
      keymap.set("Harpoon: Add file", "<leader>hi",
        function() harpoon:list():add() end
      )
      keymap.set("Harpoon: Remove file", "<leader>hr",
        function() harpoon:list():remove() end
      )
      keymap.set("Harpoon: Clear items", "<leader>hc",
        function() harpoon:list().items = {} end
      )
    end,
  }
}

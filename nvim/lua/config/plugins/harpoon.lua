return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      return {
        { "<leader>H", function() harpoon:list():append() end,                      desc = "Harpoon File" },
        { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu" },
        -- Navigation
        { "<C-h>",     function() harpoon:list():select(1) end,                     desc = "Harpoon to file 1" },
        { "<C-j>",     function() harpoon:list():select(2) end,                     desc = "Harpoon to file 2" },
        { "<C-k>",     function() harpoon:list():select(3) end,                     desc = "Harpoon to file 3" },
        { "<C-l>",     function() harpoon:list():select(4) end,                     desc = "Harpoon to file 4" },
        -- Optional: Next/Prev file navigation
        { "<C-S-P>",   function() harpoon:list():prev() end,                        desc = "Harpoon Prev File" },
        { "<C-S-N>",   function() harpoon:list():next() end,                        desc = "Harpoon Next File" },
      }
    end,
    config = function(_, opts)
      require("harpoon"):setup(opts)
    end,
  }
}

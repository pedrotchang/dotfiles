return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          -- Default settings here
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            -- Add any file_browser specific settings here
          },
        },
      })

      -- Load extensions
      telescope.load_extension("file_browser")
      telescope.load_extension("fzf")
    end,
    keys = {
      {
        "<leader>sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = true,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
      -- Add keybinding for find_files
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
    },
  },
}

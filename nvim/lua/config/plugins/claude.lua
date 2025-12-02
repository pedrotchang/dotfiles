return {
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("claude-code").setup({
        -- Window configuration
        position = "botright",  -- Options: "botright", "topleft", "vertical", "float"
        split_ratio = 0.3,      -- Size of the terminal window

        -- File refresh settings
        file_refresh = {
          enabled = true,       -- Auto-detect and reload externally modified files
        },

        -- Git integration
        git_integration = {
          enabled = true,       -- Auto-switch to project root
        },

        -- Keymaps (defaults shown, customize as needed)
        -- keymaps = {
        --   toggle = "<C-,>",
        --   resume = "<leader>cC",
        --   verbose = "<leader>cV",
        -- },
      })
    end,
  },
}

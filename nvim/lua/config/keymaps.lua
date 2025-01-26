-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- In your keymaps configuration
-- Set path to include current directory and all subdirectories
--
-- Enable gf to work with markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Make gf work with markdown links
    vim.opt_local.includeexpr = "substitute(v:fname, '#.*', '', '')"
    -- Include markdown extensions when searching for files
    vim.opt_local.suffixesadd:append(".md")
  end,
})

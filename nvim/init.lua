require("config.lazy")
print("nvim/init.lua Reloaded!")

vim.opt.shiftwidth = 4
-- 'p' only pastes what is on the clipboard buffer
-- vim.opt.clipboard = "unnamedplus" 
vim.opt.number = true
vim.opt.relativenumber = true


-- Source Current Files
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- Execute Current Lin
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- Execute Text in Visual Mode
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Yank -> Quick Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd("TermOpen", {
--   group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
--   callback = function()
--     vim.opt.number = false
--     vim.opt.relativenumber = false
--   end,
-- })
--


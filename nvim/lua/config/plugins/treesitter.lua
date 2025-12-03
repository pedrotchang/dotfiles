return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Install parsers
      local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown", "markdown_inline" }
      require("nvim-treesitter").install(ensure_installed)

      -- Enable treesitter highlighting (uses vim.treesitter in Neovim 0.10+)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  }
}

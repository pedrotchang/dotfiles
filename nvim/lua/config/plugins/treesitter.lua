return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown", "markdown_inline" },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
    main = "nvim-treesitter.configs",
  }
}

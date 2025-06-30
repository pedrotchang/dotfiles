return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        modules = {},
        sync_install = false,
        ignore_install = {},
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown", "markdown_inline", "yaml" },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)        -- Using underscore for unused parameter
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          -- maybe for ruby
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
}

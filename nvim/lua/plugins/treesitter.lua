return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "java", "python", "typescript", "javascript", "go", "html", "markdown", "markdown_inline", "query" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

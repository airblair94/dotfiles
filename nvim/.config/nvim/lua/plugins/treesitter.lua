return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {enable = true },
      sync_install = false,
      ensure_installed = {"bash", "c", "cpp", "css", "html", "javascript", "json", "lua", "python", "rust", "typescript" },
    })
  end
}

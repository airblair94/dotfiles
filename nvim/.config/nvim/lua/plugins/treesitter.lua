return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "python",
        "diff",
        "dockerfile",
        "html",
        "json",
        "ssh_config",
        "tsx"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

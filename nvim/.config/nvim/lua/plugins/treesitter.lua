return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "lua", "vim", "javascript", "python", "go" },
      auto_install = true,
      highlight = {
        enable = true
      }
    })
  end
}

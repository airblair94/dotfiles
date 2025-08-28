return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({ "lua", "vim", "javascript", "python", "go", "env", "bash", "haskell", "html",
      "json", "sql", "zig" })
  end
}

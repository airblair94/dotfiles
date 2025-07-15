return {
  'AkashKarnatak/rooter.nvim',
  config = function()
    vim.g.rooter_pattern = {'.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt'}
    vim.g.outermost_root = true
  end
}

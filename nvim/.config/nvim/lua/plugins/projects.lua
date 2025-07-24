return {
  'ahmedkhalf/project.nvim',
  config = function()
    require("project_nvim").setup {
      patterns = {'enodo', '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt'},
      detection_methods = { "pattern", "lsp" },
      scope_chdir = 'win',
      silent_chdir = true,
      show_hidden = true,
    }
  end
}

return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup {
        -- patterns = { 'enodo', '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'pkg', 'node_modules', 'CMakeLists.txt' },
        patterns = { 'finex-mono', '.git' },
        -- exclude_dirs = { '~/enodo/finex-mono/backend/*', '~/enodo/finex-mono/frontend/*' },
        detection_methods = { "pattern", "lsp" },
        scope_chdir = 'win',
        silent_chdir = false,
        show_hidden = true,
      }
    end
  },
  {
    'aymericbeaumet/vim-symlink',
    requires = { 'moll/vim-bbye' },
  }
}

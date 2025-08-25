return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          preview = {
            treesitter = false
          },
          file_ignore_patterns = {
              '.cargo/',
              '.share/',
              '.cache/',
              '.local/',
              '.ghcup/',
              'pkg/',

          }
        },
        pickers = {
          find_files = {
            hidden = true,
            follow=true,
            mappings = {
              i = {
                ["C-v"] = "file_vsplit"
              },
              n = {
                ["C-v"] = "file_vsplit"
              }
            }
          },
          repo = {},
        },
        extensions = {
          project = {
            hidden_files = true,
            ignore_missing_dirs = true
          }
        }
      }
    end
  },
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('project')
      
    end
  },
  {
    'cljoly/telescope-repo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require('telescope').load_extension('repo')
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    -- install the latest stable version
    version = "*",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  }
  
}

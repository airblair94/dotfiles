return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
            hidden = true
        },
        live_grep = {
          file_ignore_patterns = {
            'node_module',
            '.git',
            '.venv', 
            '.cache',
            '.zsh_history',
            '.viminfo',
          },
          additional_args = function(_)
            return { "--hidden" }
          end
        }
      }
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  end
}

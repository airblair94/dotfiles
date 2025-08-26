return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.ai').setup()
    require('mini.bracketed').setup()
    require('mini.pick').setup()
    require('mini.surround').setup()
    require('mini.sessions').setup()
  end
}

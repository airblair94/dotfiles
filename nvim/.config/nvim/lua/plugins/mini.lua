return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    require('mini.ai').setup({
      n_lines = 500,
      custom_textobjects = {
        a = gen_spec.treesitter { a = '@parameter.outer', i = '@parameter.inner' },
        c = gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
        f = gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        F = gen_spec.treesitter { a = '@call.outer', i = '@call.inner' },
        o = gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
      },
    })
    require('mini.bracketed').setup()
    require('mini.pick').setup()
    require('mini.surround').setup()
    require('mini.sessions').setup()
  end
}

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
        C = gen_spec.treesitter { a = '@comment.outer', i = '@comment.inner' },
        o = gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
      },
    })
    require('mini.bracketed').setup()
    require('mini.pick').setup()
    require('mini.surround').setup()
    require('mini.notify').setup()
    require('mini.indentscope').setup()
    require('mini.sessions').setup({
      directory = vim.fn.stdpath('data') .. '/session',
      file = '',
      autowrite = false,
      force = { read = false, write = true, delete = true },
    })
    local starter = require('mini.starter')
    local Mvim_starter_custom = function()
      return {
        { action = function() MiniSessions.select() end, name = "Sessions", section = "Search" },
        { action = "Telescope projects",                 name = "Projects", section = "Search" },
        { action = "Telescope find_files",               name = "Files",    section = "Search" },
        { action = "Lazy",                               name = "Lazy",     section = "Tools" },
        { action = "Mason",                              name = "Mason",    section = "Tools" },
        { action = "Quit",                               name = "Quit",     section = "Tools" }
      }
    end

    require("mini.starter").setup({
      items = {
        Mvim_starter_custom(),
        starter.sections.recent_files(5, false, false),
        starter.sections.recent_files(5, true, false),
        starter.sections.sessions(5, true),
      },
      header = function()
        local v = vim.version()
        local versionstring = string.format("  Neovim Version: %d.%d.%d", v.major, v.minor,
          v.patch)
        local image = [[
          ┌─────────────────────────────────────────┐
          │                                         │
          │    ███╗   ███╗██╗   ██╗██╗███╗   ███╗   │
          │    ████╗ ████║██║   ██║██║████╗ ████║   │
          │    ██╔████╔██║██║   ██║██║██╔████╔██║   │
          │    ██║╚██╔╝██║╚██╗ ██╔╝██║██║╚██╔╝██║   │
          │    ██║ ╚═╝ ██║ ╚████╔╝ ██║██║ ╚═╝ ██║   │
          │    ╚═╝     ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝   │
          └─────────────────────────────────────────┘
          ]]
        local finalimage = image .. versionstring
        return finalimage
      end
    })
  end
}

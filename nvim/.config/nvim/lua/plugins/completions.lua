return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'Kaiser-Yang/blink-cmp-avante',
    "giuxtaposition/blink-cmp-copilot",
    'rafamadriz/friendly-snippets',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },
    cmdline = { enabled = true },
    appearance = {
      nerd_font_variant = 'mono',
    },
    snippets = { preset = 'luasnip' },

    completion = {
      documentation = { auto_show = true },
      menu = {
        -- nvim-cmp style menu
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        }
      },
      ghost_text = { enabled = true },
    },
    sources = {
      default = { "lazydev", 'lsp', 'snippets', 'path', 'buffer', 'copilot', 'avante',},
      providers = {
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {
            -- options for blink-cmp-avante
          }
        },
        copilot = {
          module = 'blink-cmp-copilot',
          name = 'Copilot',
          opts = {
            -- options for copilot-cmp
          }
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
          async = true
        },
      }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  signature = { enabled = true },
}

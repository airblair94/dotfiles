return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
    'rafamadriz/friendly-snippets',
    {
      'saghen/blink.compat',
      version = '2.*',
      lazy = true,
      opts = {}

    },
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      config = function()
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
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        }
      },
      ghost_text = { enabled = true },
    },
    sources = {
      default = { "lazydev", 'lsp', 'snippets', 'path', 'buffer', 'copilot', },
      providers = {
        copilot = {
          module = 'blink-cmp-copilot',
          name = 'Copilot',
          opts = {} -- options for copilot-cmp
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          async = true
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
  windows = {
    autocomplete = {
      selection = "auto_insert",
    },
  },
  opts_extend = { "sources.default", 'sources.compat' },
}

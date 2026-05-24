return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
      'rafamadriz/friendly-snippets',
      {
        'supermaven-inc/supermaven-nvim',
        dependencies = {
          'huijiro/blink-cmp-supermaven',
        },
        opts = {
          disable_inline_completion = true,
          keymaps = {
            accept_suggestion = nil,
          }
        }
      },
      {
        'saghen/blink.compat',
        version = '2.*',
        lazy = true,
        opts = {}

      },
      {
        'l3mon4d3/luasnip',
        version = 'v2.*',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }
    },
    version = '1.*',
    opts_extend = { "sources.default", 'sources.compat', 'sources.completion.enabled_providers' },
    ---@module 'blink.cmp'
    ---@type blink.cmp.config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (c-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      -- see :h blink-cmp-config-keymap for defining your own keymap
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
              { "kind_icon", "kind", }
            },
            components = {
              kind = {
                text = function(ctx)
                  if ctx.source_name == 'supermaven' then return 'supermaven' end
                  return ctx.kind
                end,
              },
            }
          }
        },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lazydev", 'lsp', 'snippets', 'path', 'buffer', 'copilot', 'supermaven', },
        providers = {
          copilot = {
            module = 'blink-cmp-copilot',
            name = 'copilot',
            opts = {} -- options for copilot-cmp
          },
          lazydev = {
            name = "lazydev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            async = true
          },
          -- minuet = {
          --   name = "minuet",
          --   module = "minuet.blink",
          --   async = true,
          -- },
          supermaven = {
            name = 'supermaven',
            async = true,
            module = 'blink-cmp-supermaven',
            score_offset = 100,
          }
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  },
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
        provider = 'claude',
        provider_options = {
          claude = {
            api_key = 'anthropic_api_key_personal',
          },
        },
        lsp = {
          completion = {
            enable = false,
          },
        }
      }
    end
  },
}

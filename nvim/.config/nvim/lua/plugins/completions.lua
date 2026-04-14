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
        event = "InsertEnter",
        cmd = {
          "SupermavenUseFree",
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
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }
    },
    version = '1.*',
    opts_extend = { "sources.default", 'sources.compat', 'sources.completion.enabled_providers' },
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
              { "kind_icon", "kind", }
            },
            components = {
              kind = {
                text = function(ctx)
                  if ctx.source_name == 'supermaven' then return 'Supermaven' end
                  return ctx.kind
                end,
              },
            }
          }
        },
        ghost_text = { enabled = true },
      },
      sources = {
        -- completion = {
        --   enabled_providers = { 'supermaven' },
        -- },
        default = { "lazydev", 'lsp', 'snippets', 'path', 'buffer', 'copilot', 'minuet', 'supermaven', },
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
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            -- score_offset = 50,
            async = true,
            -- timeout_ms = 3000,
          },
          supermaven = {
            name = 'supermaven',
            async = true,
            module = 'blink-cmp-supermaven',
            score_offset = 100,
            -- opts = {
            --   cmp_name = 'supermaven',
            --   cmp_source = 'supermaven',
            --   kind = 'Supermaven'
            -- }
          }
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
    -- windows = {
    --   autocomplete = {
    --     selection = "auto_insert",
    --   },
    -- },
  },
  -- {
  --   'monkoose/neocodeium',
  --   config = function()
  --     local blink = require('blink.cmp')
  --     require('neocodeium').setup {
  --       filter = function()
  --         return not blink.is_visible()
  --       end,
  --       completion = {
  --         menu = {
  --           auto_show = function(ctx)
  --             return ctx.mode ~= 'default'
  --           end,
  --         }
  --       }
  --     }
  --   end
  -- },
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
        provider = 'claude',
        provider_options = {
          claude = {
            api_key = 'ANTHROPIC_API_KEY_PERSONAL',
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

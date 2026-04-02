return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
    config = function()
      require('mason').setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
              library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },
        config = function()
          vim.diagnostic.config({
            virtual_lines = {
              current_line = true,
            },
          })

          vim.lsp.config('*', {
            capabilities = require('blink.cmp').get_lsp_capabilities()
          })

          vim.lsp.config("vue_ls", {
            filetypes = { 'vue' },
            settings = {
              vue_language_server = {
                validation = {
                  template = true,
                  script = true,
                  style = true,
                },
              },
            },
          })

          local vue_language_server_path = vim.fn.stdpath('data') ..
              "/mason/packages/vue-language-server/node_modules"
          vim.lsp.config('ts_ls', {
            filetypes = { "typescript", "javascript", "vue", },
            -- Ensure ts_ls finds the root tsconfig.json
            -- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path, -- Mason usually handles this, but might need to be set
                  languages = { "javascript", "typescript", 'vue' },
                },
              },
            },
          })

          vim.lsp.enable('lua_ls')
          vim.lsp.enable('vue_ls')
          vim.lsp.enable('ts_ls')
        end,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      'mason-org/mason.nvim'
    },
    config = function()
      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({
        ensure_installed = {
          "ruff",
          "eslint",
          "lua_ls",
          "pylsp",
          "mypy",
          "vue_ls",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff" },
        go = { "golangcilint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        lua = { "stylua" },
        go = { "goimports", },
        vue = { lsp_format = "never" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
      lsp_format = 'fallback'
      }
    },
  }
}

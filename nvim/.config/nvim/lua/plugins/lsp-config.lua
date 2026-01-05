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
      "neovim/nvim-lspconfig",
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
          "html",
          "mypy",
          "ts_ls",
          "prettier"
        },
        automatic_installation = true,
      })
    end,
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
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
        -- virtual_text = {
        --   current_line = true,
        -- },
        virtual_lines = {
          current_line = true,
        },
      })

      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              pylint = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        filetypes = { 'typescript', 'javascript', 'vue' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { 'vue' }
            }
          }
        }
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pylsp")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("ruff")
      vim.lsp.enable("eslint_d")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        vue = { "vuels", "eslint_d" },
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
        javascript = { "eslint", "eslint_d", "prettier" },
        lua = { "stylua" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
    config = function()
      require('conform').setup({
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback'
        }
      })
    end
  },
}

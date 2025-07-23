return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "postgres_lsp",
          "eslint",

        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities,
      })
      vim.lsp.config('pylsp', {
        plugins = {
          ruff = {
            enabled = true,
            formatEnabled = true,
            lineLength = 120,
            ignore = { "E501", "E302" }
          },
        }
      })
      vim.diagnostic.config({
        virtual_text = {
          current_line = true
        }
        -- virtual_lines = {
        --   current_line = true
        -- }
      })
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('pylsp')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('eslint')


      vim.keymap.set({ 'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

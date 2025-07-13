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
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
    vim.keymap.set({ 'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

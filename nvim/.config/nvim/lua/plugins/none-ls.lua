return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
	config = function()
    require('mason-null-ls').setup {
      ensure_installed = {
        'ruff',
      }
    }

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        -- js
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        -- python
        null_ls.builtins.formatting.isort,
      },
		})
		vim.keymap.set({"n", "v"}, "<leader>gf", vim.lsp.buf.format, {})
	end,
}

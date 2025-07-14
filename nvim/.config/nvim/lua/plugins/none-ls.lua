return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        -- js
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        -- python
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.autoflake,
      },
		})
		vim.keymap.set({"n", "v"}, "<leader>gf", vim.lsp.buf.format, {})
	end,
}

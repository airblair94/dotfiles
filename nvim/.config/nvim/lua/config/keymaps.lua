vim.keymap.set("i", "jj", "<Esc>", {})
vim.keymap.set("i", "jk", "<Esc>:w<CR>", {})
vim.keymap.set("i", "jjk", "<Esc>:w<CR>", {})
vim.keymap.set("n", "<C-l>", "<C-w><right>", {})
vim.keymap.set("n", "<C-h>", "<C-w><left>", {})
vim.keymap.set("n", "<C-j>", "<C-w><down>", {})
vim.keymap.set("n", "<C-k>", "<C-w><up>", {})

local sessions = require('mini.sessions')
vim.keymap.set("n", "<leader>ss", function() sessions.write() end, { desc = "Save session" })

local noice = require('noice')
vim.keymap.set("n", "<leader>n", ':Noice history<CR>', { desc = "Notification history" })

vim.keymap.set("n", "<leader>bd", "<cmd>bp<bar>bd#<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<leader>q", ":bp|bd#<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = 'Next Buffer' })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = 'Previous Buffer' })

vim.keymap.set("n", "<C-e>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = 'Get references' })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = 'Hover' })
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, { desc = 'Go to type definition' })
vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, { desc = 'Go to type implementation' })

-- vim.keymap.set("n", "<S-h>", function() )

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = '~/.config/nvim/' }) end,
	{ desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{ hidden=true }<CR>",
	{ desc = 'Telescope projects' })
vim.keymap.set('n', '<leader>fg', ":lua require'telescope'.extensions.repo.repo{}<CR>",
	{ desc = 'Telescope git projects' })
vim.keymap.set('n', '<leader>fr', ":lua require'telescope'.extensions.frecency.frecency{workspace=CWD}<CR>",
	{ desc = 'Telescope git projects' })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

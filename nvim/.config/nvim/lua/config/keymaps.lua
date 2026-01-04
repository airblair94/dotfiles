--basics
vim.keymap.set("i", "jj", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "jk", "<Cmd>write<CR><Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "jjk", "<Cmd>write<CR><Esc>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w><right>", {})
vim.keymap.set("n", "<C-h>", "<C-w><left>", {})
vim.keymap.set("n", "<C-j>", "<C-w><down>", {})
vim.keymap.set("n", "<C-k>", "<C-w><up>", {})

local sessions = require('mini.sessions')
vim.keymap.set("n", "<leader>ss", function() sessions.write() end, { desc = "Save session" })

-- Noice
vim.keymap.set("n", "<leader>n", ':Noice history<CR>', { desc = "Notification history" })

-- Buffer shotcuts
vim.keymap.set("n", "<leader>bd", "<cmd>bp<bar>bd#<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<leader>bo", "<cmd>:%bd|e#<CR>", { desc = 'Delete Other buffers' })
vim.keymap.set("n", "<leader>q", ":bp|bd#<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = 'Next Buffer' })
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = 'Previous Buffer' })

-- Oil
vim.keymap.set("n", "<C-e>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- lsp
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = 'Get references' })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = 'Hover' })
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, { desc = 'Go to type definition' })
vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, { desc = 'Go to type implementation' })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = '~/.config/nvim/' }) end,
  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', ":lua require'telescope'.extensions.live_grep_args.live_grep_args{}<CR>",
  { desc = 'Telescope live grep args' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{ hidden=true }<CR>",
  { desc = 'Telescope projects' })
vim.keymap.set('n', '<leader>fg', ":lua require'telescope'.extensions.repo.repo{}<CR>",
  { desc = 'Telescope git projects' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references,
  { desc = 'Telescope git projects' })
vim.keymap.set('n', '<leader>fm', ':Noice telescope<CR>', { desc = 'Telescope Noice History' })
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ no_ignore = true }) end,
  { desc = 'Telescope find all files' })

-- Custom Telescope
local custom_tel = require('config.telescope.telescope-custom')
vim.keymap.set('n', '<leader>fi', custom_tel.live_grep_include, { desc = 'Telescope Grep Include Path' })
vim.keymap.set('n', '<leader>fe', custom_tel.live_grep_exclude, { desc = 'Telescope Grep Exclude Path' })

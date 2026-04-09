--basics
vim.keymap.set("i", "jj", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "jk", "<Cmd>write<CR><Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "<C-s>", "<Cmd>write<CR><Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "jjk", "<Cmd>write<CR><Esc>", { silent = true, noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w><right>", {})
vim.keymap.set("n", "<C-h>", "<C-w><left>", {})
vim.keymap.set("n", "<C-j>", "<C-w><down>", {})
vim.keymap.set("n", "<C-k>", "<C-w><up>", {})
vim.keymap.set("n", "<leader>e", "<Cmd>e<CR>", { desc = "Refresh buffer" })

vim.keymap.set("t", "<C-space>", "<C-\\><C-n>", {})
vim.keymap.set('n', '<C-_>', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd('startinsert')
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 20)
  end,
  { desc = 'Terminal' })
vim.keymap.set('n', '<C-/>', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd('startinsert')
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 20)
  end,
  { desc = 'Terminal' })

-- Messages and logs
vim.keymap.set("n", "<leader>n", ':lua MiniNotify.show_history()<CR>', { desc = "Mini Notification history" })
vim.keymap.set('n', '<leader>m', ':messages<CR>', { desc = 'Show Messages' })

-- Buffer shotcuts
vim.keymap.set("n", "<leader>bd", "<cmd>bp<bar>bd#<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<leader>bo", "<cmd>:%bd|e#<CR>", { desc = 'Delete Other buffers' })
vim.keymap.set("n", "<leader>ba", "<cmd>%bd<CR>", { desc = 'Delete Other buffers' })
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
  { desc = 'Telescope find config files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', ":lua require'telescope'.extensions.live_grep_args.live_grep_args{}<CR>",
  { desc = 'Telescope live grep args' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fp', ":Telescope projects<CR>", { desc = 'Telescope projects' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope lsp references' })
vim.keymap.set('n', '<leader>fm', ':Noice telescope<CR>', { desc = 'Telescope Noice History' })
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ no_ignore = true }) end,
  { desc = 'Telescope find all files' })

-- Custom Telescope
local custom_tel = require('config.telescope.telescope-custom')
vim.keymap.set('n', '<leader>fi', custom_tel.live_grep_include, { desc = 'Telescope Grep Include Path' })
vim.keymap.set('n', '<leader>fe', custom_tel.live_grep_exclude, { desc = 'Telescope Grep Exclude Path' })

-- AI Tools
vim.keymap.set('n', '<leader>ct', '<Cmd>CodexToggle<CR><Esc>', {})

-- Sessions
local sessions = require('mini.sessions')
vim.keymap.set('n', '<leader>ss',
  function()
    local root = vim.fn.getcwd(0, 0)
    local project_name = vim.fn.fnamemodify(root, ":t")
    if vim.v.this_session == '' then
      sessions.write(project_name)
    else
      local session_name = vim.fn.fnamemodify(vim.v.this_session, ':t:r')
      sessions.write(session_name)
    end
  end,
  { desc = 'Save session' })
vim.keymap.set('n', '<leader>fs', function() sessions.select() end, { desc = 'Find session' })

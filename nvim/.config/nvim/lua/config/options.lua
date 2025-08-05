vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("i", "jjk", "<Esc> :w <Enter>", {})
vim.keymap.set("n", "<C-l>", "<C-w><right>", {})
vim.keymap.set("n", "<C-h>", "<C-w><left>", {})
vim.keymap.set("n", "<C-j>", "<C-w><down>", {})
vim.keymap.set("n", "<C-k>", "<C-w><up>", {})
vim.wo.relativenumber = true
vim.o.winborder = "rounded"

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
vim.diagnostic.config({
  -- virtual_text = true
  virtual_lines = {
    current_lines = true
  }
})

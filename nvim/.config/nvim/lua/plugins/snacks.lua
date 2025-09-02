return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end,         desc = "Lazygit" },
    { "<c-/>",      function() Snacks.terminal() end,        desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end,        desc = "which_key_ignore" },
    -- { "<C-/>",      function() Snacks.terminal() end,        desc = "Terminal" },
    { "<leader>sp", function() Snacks.picker.projects() end, desc = "Snacks Projects" }
  }
}

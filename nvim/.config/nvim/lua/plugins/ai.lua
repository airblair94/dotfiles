return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'kkrampis/codex.nvim',
    lazy = true,
    cmd = { 'Codex', 'CodexToggle' }, -- Optional: Load only on command execution
    keys = {
      {
        '<C-.>', -- Change this to your preferred keybinding
        function() require('codex').toggle() end,
        desc = 'Toggle Codex popup or side-panel',
        mode = { 'n', 't' }
      },
    },
    opts = {
      keymaps     = {
        toggle = nil,          -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
        quit = '<C-q>',        -- Keybind to close the Codex window (default: Ctrl + q)
      },                       -- Disable internal default keymap (<leader>cc -> :CodexToggle)
      border      = 'rounded', -- Options: 'single', 'double', or 'rounded'
      width       = 0.4,       -- Width of the floating window (0.0 to 1.0)
      height      = 0.4,       -- Height of the floating window (0.0 to 1.0)
      model       = nil,       -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
      autoinstall = true,      -- Automatically install the Codex CLI if not found
      panel       = true,      -- Open Codex in a side-panel (vertical split) instead of floating window
      use_buffer  = false,     -- Capture Codex stdout into a normal buffer instead of a terminal buffer
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    diff_opts = {
      keep_terminal_focus = true,
    },
    keys = {
      { "<leader>a",  nil,                              desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
  },
  {
    "nickjvandyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      local opencode_cmd = "opencode"

      -- Define layout options to stick the window on the right side
      local snacks_terminal_opts = {
        win = {
          position = "right",
          width = 65,   -- Sets the split width size
          enter = true, -- Automatically drops your cursor into it to type immediately
        },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          -- Hook OpenCode's engine to the visible right-side terminal split
          start = function()
            require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
          end,
        },
      }
      -- Recommended/example keymaps
      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ") end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Select OpenCode…" })
      vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this") end,
        { desc = "Send range to OpenCode", expr = true })
      vim.keymap.set({ "n" }, "goo", function() return require("opencode").operator("@this") .. "_" end,
        { desc = "Send line to OpenCode", expr = true })
      vim.keymap.set({ 'n', 't' }, "<leader>oc",
        function() require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts) end,
        { desc = "Toggle OpenCode" })
    end,
  }
}

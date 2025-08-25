return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {

      --[[add your custom lualine config here]]
      options = {
        theme = "onedark",
      },
      sections = {
        lualine_a = {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Recording @" .. reg
            end
            local mode = vim.fn.mode()
            local mode_map = {
              n = "NORMAL",
              i = "INSERT",
              v = "VISUAL",
              V = "V-LINE",
              ["^V"] = "V-BLOCK",
              c = "COMMAND",
              R = "REPLACE",
              s = "SELECT",
              S = "S-LINE",
              ["^S"] = "S-BLOCK",
              t = "TERMINAL",
            }

            -- Return the full mode name
            return mode_map[mode] or mode:upper()
          end,
        },
        -- lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "buffers", "branch" },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch" },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    }
  end,
}

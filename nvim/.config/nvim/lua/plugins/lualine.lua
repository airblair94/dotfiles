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
        lualine_c = {
          "branch",
          {
            "buffers",
            hide_filename_extensions = true,
            show_modified_status = true,
            use_mode_colors = true,
            mode = 2,
            buffers_color = {
              active = { bg = '#336699', fg = '#FFFFFF' }, -- Example: blue background, white text for active
              inactive = { bg = '#222222', fg = '#888888' }, -- Example: dark gray background, light gray text for inactive
            },
          },
        },
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

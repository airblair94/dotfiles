local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local M = {}

local live_grep_helper = function(opts, include_exclude)
  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "--hidden")
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] and include_exclude == 'exclude' then
        table.insert(args, "--iglob")
        table.insert(args, "**/" .. pieces[2] .. "/**")
      end

      if pieces[2] and include_exclude == 'include' then
        table.insert(args, "--iglob")
        table.insert(args, "**/" .. pieces[2] .. "/**")
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }
  return finder

  -- pickers.new(opts, {
  --   debounce = 100,
  --   prompt_title = "Live Grep Include Path",
  --   finder = finder,
  --   preview = conf.grep_previewer(opts),
  --   sorter = require("telescope.sorters").empty(),
  -- }):find()
end

function M.live_grep_include(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()
  local finder = live_grep_helper(opts, 'include')
  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Live Grep Include Path",
    finder = finder,
    preview = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

function M.live_grep_exclude(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()
  local finder = live_grep_helper(opts, 'exclude')
  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Live Grep Exclude Path",
    finder = finder,
    preview = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

return M

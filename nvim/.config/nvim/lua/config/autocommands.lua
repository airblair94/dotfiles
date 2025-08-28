vim.api.nvim_create_autocmd("FileType", {
  callback = function(details)
    local bufnr = details.buf
    if not pcall(vim.treesitter.start, bufnr) then -- try to start treesitter which enables syntax highlighting
      return                                     -- Exit if treesitter was unable to start
    end
    vim.bo[bufnr].syntax = "on"                  -- Use regex based syntax-highlighting as fallback as some plugins might need it
  end
})

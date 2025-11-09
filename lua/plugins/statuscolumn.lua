-- Define the highlight group first
vim.api.nvim_set_hl(0, 'NumberColumnBorder', { fg = '#ffffff', bg = 'NONE' })

-- Define the function we will use to generate the format string (can be local now)
local function get_statuscol_format()
  local border_char = '.'
  local border_hl_start = '%#' .. 'NumberColumnBorder' .. '#'
  local border_hl_end = '%*'

  -- The format string includes the line number (%l), a space, and the colored border character.
  -- Notice we use a single %l here, not %%l, because this string is assigned directly to the option
  return string.format('%%l %s%s%s', border_hl_start, border_char, border_hl_end)
end

-- Set the statuscolumn option by calling the function immediately and assigning the result
vim.opt.statuscolumn = get_statuscol_format()

local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

-- ------------------- VISUALS & HIGHLIGHTING -------------------

-- Set the color for line numbers
api.nvim_set_hl(0, "LineNr", { fg = "#888888" })

-- Set the color for the current line number
api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

-- Optional: Set colors for relative line numbers (if enabled)
api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })

-- Change the background color of the current line
api.nvim_set_hl(0, "CursorLine", { bg = "#404040", bold = true })

-- Make background transparent for Normal and NonText
cmd("highlight Normal guibg=NONE ctermbg=NONE")
cmd("highlight NonText guibg=NONE ctermbg=NONE")

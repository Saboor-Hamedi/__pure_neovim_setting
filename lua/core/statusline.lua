local opt = vim.opt
local api = vim.api

-- ------------------- STATUS LINE -------------------

-- Statusline: Always show the statusline
opt.laststatus = 2

-- Set the content of the statusline
opt.statusline = "%F%=%l:%c | %P"

-- Set the background and foreground color of the statusline
api.nvim_set_hl(0, "StatusLine", { bg = "#404040", fg = "#ffffff" })

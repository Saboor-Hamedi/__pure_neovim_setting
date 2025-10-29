local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
-- ------------------- CORE SETTINGS -------------------
-- Disable compatibility with vi which can cause unexpected issues.
opt.compatible = false
-- Disable the vim bell
opt.visualbell = true
opt.errorbells = false
-- Clipboard: Use system clipboard for yank/paste
opt.clipboard = "unnamedplus"
-- Indentation: Use 4 spaces for tabs and auto-indent
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
-- Line Numbers
opt.number = true         -- Absolute line number
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes"    -- Always show sign column

-- Searching
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Overrides ignorecase if the search pattern contains capital letters

-- UI/UX
opt.mouse = "a"           -- Enable mouse support in all modes
opt.scrolloff = 8         -- Minimum lines to keep above and below cursor
opt.undofile = true       -- Persistent undo history
opt.cursorline = true     -- Highlight the current line
opt.swapfile = false      -- Disable swap files
opt.wrap = true           -- Wrap lines
opt.list = true           -- Show invisible characters
opt.listchars = "space:." -- Define what invisible characters look like
opt.termguicolors = true  -- Enable 24-bit colors in the terminal

-- Splits
opt.splitbelow = true -- New split windows below the current one
opt.splitright = true -- New vertical split windows to the right of the current one

-- Searching and History
opt.showmode = true   -- Show the mode you are on the last line.
opt.showmatch = true  -- Show matching words during a search.
opt.history = 1000    -- Set the commands to save in history
-- File Searching
opt.wildmenu = true             -- Enable auto completion menu after pressing TAB.
-- Wild menu will ignore files with these extensions.
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
opt.path:append { "**" }        -- Search down to subfolders
-- Spell Check
opt.spell = true
opt.smarttab = true
-- ------------------- VISUALS & HIGHLIGHTING -------------------
-- Set the color for line numbers
api.nvim_set_hl(0, "LineNr", { fg = "#888888" })

-- Set the color for the current line number
api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

-- Optional: Set colors for relative line numbers (if enabled)
api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
-- FIX: Changed api.nvim.set_hl to api.nvim_set_hl
api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })

-- Change the background color of the current line
api.nvim_set_hl(0, "CursorLine", { bg = "#404040", bold = true })

-- Make background transparent for Normal and NonText
cmd("highlight Normal guibg=NONE ctermbg=NONE")
cmd("highlight NonText guibg=NONE ctermbg=NONE")
-- ------------------- STATUS LINE -------------------
-- Statusline: Always show the statusline
opt.laststatus = 2

-- Set the content of the statusline
opt.statusline = "%F%=%l:%c | %P"

-- Set the background and foreground color of the statusline
api.nvim_set_hl(0, "StatusLine", { bg = "#404040", fg = "#ffffff" })

vim.g.mapleader = " "
vim.bo.commentstring = '#%s'
vim.bo.commentstring = '#%s'

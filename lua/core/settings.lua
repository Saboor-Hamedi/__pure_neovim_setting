local opt = vim.opt
local api = vim.api
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
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
opt.ignorecase = true    -- Ignore case in search patterns
opt.smartcase = true     -- Overrides ignorecase if the search pattern contains capital letters
opt.path:append { "**" } -- Search recursively in subfolders

-- UI/UX
opt.mouse = "a"          -- Enable mouse support in all modes
opt.scrolloff = 8        -- Minimum lines to keep above and below cursor
opt.showtabline = 2
opt.undofile = true      -- Persistent undo history
opt.cursorline = true    -- Highlight the current line
opt.swapfile = false     -- Disable swap files
opt.wrap = true          -- Wrap lines
opt.list = true          -- Show invisible characters
-- opt.listchars = "space:." -- Define what invisible characters look like
opt.termguicolors = true -- Enable 24-bit colors in the terminal

-- Splits
opt.splitbelow = true -- New split windows below the current one
opt.splitright = true -- New vertical split windows to the right of the current one

-- Searching and History
opt.showmode = true  -- Show the mode you are on the last line.
opt.showmatch = true -- Show matching words during a search.
opt.history = 1000   -- Set the commands to save in history

-- File Searching
opt.wildmenu = true      -- Enable auto completion menu after pressing TAB.
opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
opt.path:append { "**" } -- Search down to subfolders
-- Spell Check
opt.spell = true

vim.cmd('filetype on')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')


-- Optional highlight tweaks
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#88c0d0", bold = true })
vim.api.nvim_set_hl(0, "String", { fg = "#a3be8c" })
-- Go to the next diagnostic (error/warning)
api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- Go to the previous diagnostic
api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- Show the diagnostic message in a floating window (at cursor position)
api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

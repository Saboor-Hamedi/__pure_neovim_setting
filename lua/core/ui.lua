-- 🎨 UI CONFIG

-- Enable basic syntax highlighting and file detection
vim.cmd [[
  syntax enable
  filetype plugin indent on
  set background=dark
  colorscheme default
]]

-- Custom highlight groups
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#a8ff60" })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffd75f", bold = true })

-- Minimal statusline
vim.o.statusline = "%f %m %= %y [%{&fileencoding}] %l:%c"

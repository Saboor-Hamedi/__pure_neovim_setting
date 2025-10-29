
local cmd = vim.cmd
cmd [[
  syntax enable
  filetype plugin indent on
  set termguicolors
  set background=dark
  colorscheme desert
]]

vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#a8ff60" })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffd75f", bold = true })



local opt = vim.opt
local api = vim.api
local opts = {noremap= true, silent = true}
-- Search for files 
api.nvim_set_keymap('n', '<leader>f', ':find ', opts)

-- Closing compaction in insert mode
-- api.nvim_set_keymap('i', '[', '[]<left>', opts)
api.nvim_set_keymap('i', '(', '()<left>', opts)
api.nvim_set_keymap('i', '{', '{}<left>', opts)
api.nvim_set_keymap('i', '"', '""<left>', opts)
api.nvim_set_keymap('i', '/*', '/**/<left><left>', opts)

api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', opts)
api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', opts)

api.nvim_set_keymap('n', '<leader>g', ':vimgrep /', opts)
--Open Telescope
api.nvim_set_keymap('n', '<leader>mm', '<cmd>Mason<CR>', opts)

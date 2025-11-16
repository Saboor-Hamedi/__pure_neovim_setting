local api = vim.api
local neo_tree = require("neo-tree")

neo_tree.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  filesystem = {
    filtered_items = {
      visible = true, -- Shows filtered items like .git, node_modules
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true, -- Automatically reveal the current file in the tree
    },
  },
  window = {
    position = "left", -- Set to "right" if you prefer the explorer on the right
    width = 30,
  },
})

-- Key Mapping: Toggle Neo-tree with <leader>e
local opts = { noremap = true, silent = true }
api.nvim_set_keymap('n', '<leader>e', '<cmd>Neotree toggle<CR>', opts)
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)

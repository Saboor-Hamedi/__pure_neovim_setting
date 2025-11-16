local api = vim.api
local telescope = require('telescope')

-- Configure Telescope defaults and specific pickers
telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = "❯ ",
        -- Ignore common development directories for faster searches
        file_ignore_patterns = { "node_modules", ".git", "vendor" },
    },
    pickers = {
        find_files = {
            hidden = true, -- Include hidden files in the search
        },
    },
})

-- Set up Key Mappings
local opts = { noremap = true, silent = true }

-- Map <leader>ff to Find Files
api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', opts)

-- Map <leader>fg to Live Grep (search for text content)
api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)

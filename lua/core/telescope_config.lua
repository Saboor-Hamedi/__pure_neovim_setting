local api = vim.api
local telescope = require('telescope')

-- Configure Telescope defaults and specific pickers
telescope.setup({
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            height = 0.5,
            width = 0.5,
            prompt_position = 'top',
        },
        prompt_prefix = "  ",
        selection_caret = "❯ ",
        -- Ignore common development directories for faster searches
        file_ignore_patterns = {
            "node_modules",
            ".git",
            "vendor",
            "dist",
            "%.zip",
            "pack/*",
            "%.bak$",
        },
        -- Custom Mappings: This is the key change!
        mappings = {
            i = {
                -- Move down the results list
                ["<C-j>"] = "move_selection_next",
                ["<Down>"] = "move_selection_next",

                -- Move up the results list
                ["<C-k>"] = "move_selection_previous",
                ["<Up>"] = "move_selection_previous",
            },

            n = {
                ["j"] = "move_selection_next",
                ["k"] = "move_selection_previous",
            },
        },

        borderchars = {
            { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
        },
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
api.nvim_set_keymap('n', '<leader>sk', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts) -- List Open Buffers

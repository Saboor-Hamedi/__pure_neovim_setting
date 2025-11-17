local lualine = require('lualine')

lualine.setup({
    options = {
        theme = 'auto',
        -- component_separators = '|',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' }, -- Beautiful rounded separators
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        -- Left side (File info)
        lualine_a = { 'mode' }, -- Current mode (NORMAL, INSERT, etc.)
        lualine_c = {
            { 'filename', path = 0 }, -- Shows the filename relative to the CWD
            { 'searchcount', icon = '' }, -- Shows current search matches
        },

        lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Git branch, Git diffs, LSP warnings/errors
        -- Right side (Line/column numbers, file type)
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' }, -- Read percentage of the file
        lualine_z = { 'location' }, -- Line and Column number

    },
    -- Configure the extensions (e.g., for showing the tree-sitter context)
    extensions = { 'quickfix', 'nvim-tree', 'man', 'toggleterm' },
})

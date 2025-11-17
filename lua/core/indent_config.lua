local api = vim.api
api.nvim_set_hl(0, 'IblContext', { fg = '#00d26a' })
api.nvim_set_hl(0, 'IblIndent', { fg = '#89b4fa' })     -- blue indent bars
api.nvim_set_hl(0, 'IblScope', { bg = '#2a2e45' })      -- subtle blue bg
api.nvim_set_hl(0, 'IblScopeStart', { fg = '#89b4fa' }) -- blue start char
api.nvim_set_hl(0, 'IblScopeEnd', { fg = '#89b4fa' })   -- blue end char
require('ibl').setup({
    indent = {
        char = '▏',
    },
    scope = {
        enabled = true,
        highlight = 'IblContext', -- now it exists!
        show_start = true,
        show_end = true,
    },
    scope_chars = {
        start = '▔', -- U+2594 UPPER LIGHT SHADE (soft top bar)
    },
    exclude = {
        filetypes = {
            'help', 'dashboard', 'NvimTree', 'Trouble',
            'alpha', 'lir', 'Outline', 'spectre_panel',
            'toggleterm', 'DressingSelect', 'lazy',
        },
    },
})

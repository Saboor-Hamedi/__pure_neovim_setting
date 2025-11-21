local ts = require('nvim-treesitter.configs')

ts.setup({
    ensure_installed = { "lua", "python", "javascript", "html", "css" },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})

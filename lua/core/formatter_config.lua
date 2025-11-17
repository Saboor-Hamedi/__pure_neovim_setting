local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        php = { "phpcbf" },
    },
    format = {
        stop_after_first = true
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP formatting if conform has no specific formatter
    },
})
-- This is optional
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
    "n",
    "<leader>fm",
    "<cmd>ConformFormat<CR>",
    opts
)

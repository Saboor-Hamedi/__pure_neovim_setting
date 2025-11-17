vim.cmd('packadd nvim-lspconfig')

vim.cmd('packadd mason.nvim')
vim.cmd('packadd mason-lspconfig.nvim')
local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
-- 1. Setup Mason (the package manager for LSPs)
mason.setup()
mason_lspconfig.setup({
    -- Add the language servers you want to install and use here.
    -- Example servers:
    ensure_installed = {
        "lua_ls",
        "intelephense",
        "jdtls",
        "sqlls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
    },

    -- Function to ensure servers start and attach automatically
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

-- Optional: Key mapping for renaming symbols, another LSP function
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd mason.nvim')
vim.cmd('packadd mason-lspconfig.nvim')

-- Now safely define local variables
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- ... rest of your configuration ...

mason.setup()

mason_lspconfig.setup({
    -- Corrected list (no formatters like 'prettier')
    ensure_installed = {
        "lua_ls", "intelephense", "pyright", "html", "cssls", "sqlls",
    },

    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

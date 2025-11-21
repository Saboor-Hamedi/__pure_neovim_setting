local leap = require('leap')

leap.setup({}) -- Clean setup is best for compatibility

-- Optional: Define custom highlights for the target labels
-- This uses colors from your Catppuccin theme to make targets clear.
vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#e5c54e", bold = true })
vim.api.nvim_set_hl(0, "LeapLabelSecondary", { fg = "#89b4fa", bold = true })

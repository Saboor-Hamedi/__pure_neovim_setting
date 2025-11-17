require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true, -- Set to true for a fully transparent background
    term_colors = true,
})

vim.cmd.colorscheme("catppuccin")
vim.opt.background = "dark"                 -- Ensure background is set to dark mode for mocha/macchiato
vim.opt.termguicolors = true                -- Essential for modern colorschemes
vim.cmd("highlight Normal guibg=none")      -- Makes the main background transparent
vim.cmd("highlight NormalFloat guibg=none") -- Makes floating windows (Telescope) transparent

-- Mason bg
vim.cmd('highlight MasonNormal guibg=#181825')
-- telescope
-- vim.cmd("highlight NormalFloat guibg=#181825")
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#89b4fa" })

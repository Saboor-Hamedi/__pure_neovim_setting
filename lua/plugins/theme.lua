return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- [[ 1. Set Global Variables (Vimscript-style options) ]]
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true -- Making it transparent by default
    vim.g.nord_italic = false -- Good: Disables italics globally
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false -- Good: Disables bolding globally

    -- [[ 2. Set the Colorscheme ]]
    -- The `require('nord').set{}` function is used to set specific options
    -- and applies the colorscheme right away. The vim.g variables above are mostly for legacy options.
    require('nord').set {
      nord_italic = false, -- Redundant, as vim.g.nord_italic is already set above
    }

    -- [[ 3. Transparency Toggle Function ]]
    -- This toggle is functional, but `vim.cmd.colorscheme` is slightly more modern than `vim.cmd [[colorscheme nord]]`
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd.colorscheme 'nord' -- Cleaner way to run the command
    end

    vim.keymap.set('n', '<leader>tb', toggle_transparency, { noremap = true, silent = true })
  end,
}

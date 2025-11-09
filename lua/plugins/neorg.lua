return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading for proper functionality
    version = '*', -- Pin to the latest stable release
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local notes_dir = 'D:/notes'
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behavior
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                -- main = '~/neorg/main',
                notes = notes_dir,
              },
              default_workspace = 'notes',
            },
          },
          ['core.journal'] = {}, -- Add other modules as needed, e.g., "core.journal", "core.completion"
        },
      }
    end,
  },
}

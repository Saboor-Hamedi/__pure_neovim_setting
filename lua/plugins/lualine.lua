return {
  -- 'nvim-lualine/lualine.nvim',
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- config = function()
  --   local function filetype_with_icon()
  --     local ft = vim.bo.filetype
  --     if ft == '' then
  --       return ''
  --     end
  --     local icon = require('nvim-web-devicons').get_icon(ft)
  --     if icon and icon[1] then
  --       return icon[1] .. ' ' .. ft
  --     else
  --       return ft
  --     end
  --   end
  --
  --   local function branch_with_icon()
  --     local branch = vim.fn['fugitive#head']()
  --
  --     if branch == '' then
  --       local head_path = vim.fn.getcwd() .. '/.git/HEAD'
  --       local file = io.open(head_path, 'r')
  --       if file then
  --         local line = file:read '*l'
  --         file:close()
  --         if line and line:match 'ref: refs/heads/(.+)' then
  --           branch = line:match 'ref: refs/heads/(.+)'
  --         elseif line then
  --           branch = line:sub(1, 7)
  --         end
  --       end
  --     end
  --     if branch == '' then
  --       return ''
  --     end
  --
  --     local config_path = vim.fn.getcwd() .. '/.git/config'
  --     local file = io.open(config_path, 'r')
  --     local is_github = false
  --     if file then
  --       for line in file:lines() do
  --         if line:lower():find 'url' and line:lower():find 'github%.com' then
  --           is_github = true
  --           break
  --         end
  --       end
  --       file:close()
  --     end
  --
  --     local icon = is_github and ' ' or ' '
  --     return icon .. branch
  --   end
  --
  --   local mode = {
  --     'mode',
  --     fmt = function(str)
  --       local icons = {
  --         n = ' NORMAL',
  --         i = ' INSERT',
  --         R = ' REPLACE',
  --         v = ' VISUAL',
  --         V = ' V·LINE',
  --         [''] = ' V·BLOCK',
  --         c = ' CMD',
  --         s = ' SELECT',
  --         S = ' S·LINE',
  --         [''] = ' S·BLOCK',
  --         t = ' TERM',
  --       }
  --       return icons[str] or ' ' .. str
  --     end,
  --     color = { fg = '#efe', bold = true },
  --   }
  --
  --   local filename = {
  --     'filename',
  --     path = 0,
  --     symbols = {
  --       modified = ' ●',
  --       readonly = ' ',
  --       unnamed = '[No Name]',
  --     },
  --   }
  --
  --   local diagnostics = {
  --     'diagnostics',
  --     sources = { 'nvim_diagnostic' },
  --     sections = { 'error', 'warn' },
  --     symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  --     colored = false,
  --     update_in_insert = false,
  --   }
  --
  --   local diff = {
  --     'diff',
  --     colored = false,
  --     symbols = { added = ' ', modified = ' ', removed = ' ' },
  --   }
  --
  --   require('lualine').setup {
  --     options = {
  --       icons_enabled = true,
  --       theme = 'desert',
  --       section_separators = { left = '', right = '' },
  --       component_separators = { left = '', right = '' },
  --       disabled_filetypes = { 'alpha', 'neo-tree', 'NvimTree', 'notify' },
  --       always_divide_middle = true,
  --       globalstatus = true,
  --     },
  --     sections = {
  --       lualine_a = {
  --         {
  --           function()
  --             return branch_with_icon()
  --           end,
  --           icon = '',
  --         },
  --       },
  --       lualine_b = { {
  --         function()
  --           return filetype_with_icon()
  --         end,
  --       } },
  --       lualine_c = { filename },
  --       lualine_x = { diagnostics, diff },
  --       lualine_y = { 'location', 'progress' },
  --       lualine_z = { mode },
  --     },
  --     inactive_sections = {
  --       lualine_a = {},
  --       lualine_b = {},
  --       lualine_c = { { 'filename', path = 1 } },
  --       lualine_x = {},
  --       lualine_y = { 'location' },
  --       lualine_z = {},
  --     },
  --     extensions = { 'fugitive', 'nvim-tree' },
  --   }
  -- end,
  'nvim-lualine/lualine.nvim',
  config = function()
    -- 1. Mode Component: White text, Yellowish background
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
      -- Lualine internally maps these to LualineModeNormal, LualineModeInsert, etc.
      -- The 'bg' will be handled by Lualine's internal theme engine for different modes
      color = {
        fg = '#FFFFFF', -- White text
        bg = '#FFBF00', -- A nice yellow
        gui = 'bold',
      },
    }

    -- 2. Git Branch Component: Added GitHub icon
    local branch = {
      'branch',
      icons_enabled = true,
      icon = ' ', -- GitHub icon
    }

    -- 3. Filename Component (File Name ONLY)
    local filename = {
      'filename',
      file_status = true,
      path = 0, -- 0 = just filename
    }

    -- 4. File Extension Component (Custom Component)
    local file_extension = {
      function()
        local filename = vim.fn.bufname()
        local ext = filename:match '%.([^%./]+)$'
        if ext then
          return '.' .. ext
        else
          return ''
        end
      end,
      -- Use the 'lualine_c_inactive' highlight group color,
      -- which is usually dimmed like a comment/inactive color in the 'nord' theme.
      color = { group = 'lualine_c_inactive' },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'nord',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename, file_extension },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

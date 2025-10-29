
-- BASIC OPTIONS
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
-- ------------------- CORE SETTINGS -------------------
require('core.autocmds')
require('core.ui')
-- ------------------- STATUS LINE -------------------
-- FIX: Rewritten to ensure safe closing and prevent Neovim from quitting.
function ToggleNetrw()
    local netrw_buf_name = "__Netrw__"
    -- Check if a window showing the Netrw buffer exists
    local netrw_bufnr = vim.fn.bufnr(netrw_buf_name)
    local netrw_winid = -1

    if netrw_bufnr ~= -1 then
        for _, winid in ipairs(api.nvim_list_wins()) do
            if api.nvim_win_get_buf(winid) == netrw_bufnr then
                netrw_winid = winid
                break
            end
        end
    end

    if netrw_winid ~= -1 then
        -- Netrw is open. Close the specific window.
        -- Move the cursor away from the window being closed if necessary
        if api.nvim_get_current_win() == netrw_winid then
            vim.cmd("wincmd p")
        end
        -- Close the Netrw window (safely)
        api.nvim_win_close(netrw_winid, true)
    else
        -- Netrw is closed. Open it and move cursor back to the file.
        vim.cmd("vertical 28 Lexplore")
        vim.cmd("wincmd p")
    end
end

-- KEYMAPS
local default_opts = { noremap = true, silent = true }

-- Toggle File Explorer (Sidebar) using <leader>e
-- This now correctly calls the global Lua function ToggleNetrw()
api.nvim_set_keymap('n', '<leader>e', '<cmd>lua ToggleNetrw()<CR>', default_opts)

-- Closing compaction in insert mode
api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
api.nvim_set_keymap('i', '/*', '/**/<left><left>', { noremap = true })

-- Disable auto commenting in a new line for certain file types
api.nvim_create_autocmd("FileType", {
    callback = function()
        -- The Lua way to modify formatoptions: remove 'c' (comment), 'r' (return), 'o' (open)
        opt.formatoptions:remove({'c', 'r', 'o'})
    end,
})

-- Removed the old 'VimEnter' block to ensure the sidebar starts closed by default.

-- Set comment string for buffer (can be useful for filetype detection)
vim.bo.commentstring = '#%s'
vim.bo.commentstring = '#%s'

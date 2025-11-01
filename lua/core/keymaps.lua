local opt = vim.opt
local api = vim.api

-- ------------------- KEY BINDINGS & AUTOCMDS -------------------
-- Leader Key

-- 🌲 Super Minimal Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = '^\\./$,^\\../$'
vim.g.netrw_sort_by = 'name'
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_fastbrowse = 0


function ToggleNetrw()
    local netrw_buf_name = "__Netrw__"
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
        if api.nvim_get_current_win() == netrw_winid then
            vim.cmd("wincmd p")
        end
        api.nvim_win_close(netrw_winid, true)
    else
        vim.cmd("vertical 28 Lexplore")
        vim.cmd("wincmd p")
    end
end
-- Disable auto commenting in a new line for certain file types
api.nvim_create_autocmd("FileType", {
    callback = function()
        opt.formatoptions:remove({'c', 'r', 'o'})
    end,
})


-- KEYMAPS
local default_opts = { noremap = true, silent = true }

-- Toggle File Explorer (Sidebar)
api.nvim_set_keymap('n', '<leader>e', '<cmd>lua ToggleNetrw()<CR>', default_opts)
-- Unmap the potentially dangerous default 'D' for netrw buffers

-- Closing compaction in insert mode
api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
api.nvim_set_keymap('i', '/*', '/**/<left><left>', { noremap = true })

-- Search for files 
api.nvim_set_keymap('n', '<C-p>', ':find ', { noremap = true })

api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', { noremap = true })

api.nvim_set_keymap('n', '<leader>g', ':vimgrep /', { noremap = true })
-- Set comment string for buffer
vim.bo.commentstring = '#%s'
vim.bo.commentstring = '#%s'

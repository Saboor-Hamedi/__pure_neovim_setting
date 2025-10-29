local opt = vim.opt
local api = vim.api

-- ------------------- KEY BINDINGS & AUTOCMDS -------------------

-- Leader Key
vim.g.mapleader = " "

-- Function to toggle the Netrw sidebar
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

-- KEYMAPS
local default_opts = { noremap = true, silent = true }

-- Toggle File Explorer (Sidebar)
api.nvim_set_keymap('n', '<leader>e', '<cmd>lua ToggleNetrw()<CR>', default_opts)

-- Closing compaction in insert mode
api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true })
api.nvim_set_keymap('i', '(', '()<left>', { noremap = true })
api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true })
api.nvim_set_keymap('i', '/*', '/**/<left><left>', { noremap = true })

-- Disable auto commenting in a new line for certain file types
api.nvim_create_autocmd("FileType", {
    callback = function()
        opt.formatoptions:remove({'c', 'r', 'o'})
    end,
})

-- Set comment string for buffer
vim.bo.commentstring = '#%s'
vim.bo.commentstring = '#%s'

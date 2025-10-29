-- =========================================================
-- 🔁 AUTOCMDS
-- =========================================================
local api = vim.api

-- Highlight text on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Auto reload Lua config on save
api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  command = "source %",
})

-- Automatically remove trailing spaces on save
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

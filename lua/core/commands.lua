local api = vim.api 
api.nvim_create_user_command("Py", function(opts)
    local file = opts.args ~= "" and opts.args or vim.fn.expand("%")
    vim.cmd("!" .. "python " .. file)
end, { nargs = "?", complete = "file" })
vim.cmd("cabbrev p Py")

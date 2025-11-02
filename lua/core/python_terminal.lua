local function run_python_universal()
  vim.cmd 'write'
  local file = vim.fn.expand '%:p'
  local dir = vim.fn.fnamemodify(file, ':h')

  -- Find .venv (optional)
  local current = dir
  local venv_python = nil
  for _ = 1, 5 do
    local venv_dir = current .. '\\.venv'
    if vim.loop.fs_stat(venv_dir) then
      local py = venv_dir .. '\\Scripts\\python.exe'
      if vim.loop.fs_stat(py) then
        venv_python = py
      end
      break
    end
    local parent = vim.fn.fnamemodify(current, ':h')
    if parent == current then
      break
    end
    current = parent
  end

  -- Use python.exe or venv
  local python_cmd = venv_python or 'python'

  -- Wrap all paths in double quotes, avoid backslash confusion
  local cmd = string.format('start cmd /k "cd /d "%s" && "%s" "%s" & pause"', dir, python_cmd, file)

  print('Running: ' .. python_cmd .. ' ' .. file)
  vim.fn.system(cmd)
end

vim.keymap.set('n', '<F5>', run_python_universal, { desc = 'Run Python (no close)' })
-- vim.keymap.set("n", "<C-r>", run_python_universal, { desc = "Run Python" })
vim.keymap.set('n', '<leader>r', ':term python main.py<CR>', { noremap = true, silent = true })

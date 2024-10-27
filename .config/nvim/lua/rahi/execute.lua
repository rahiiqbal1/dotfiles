-- leader re, execute code!
local execute_code = function()
  -- Checking for and executing python code:
  if vim.bo.filetype == "python" then
    local run_cmd = "python3 " .. vim.fn.expand('%:p')
    vim.cmd(":w")
    vim.cmd([[:set sb]])
    vim.cmd("split | resize 10 | term " .. run_cmd)
    vim.cmd("startinsert")

  elseif vim.bo.filetype == "zig" then
    local run_cmd = "zig run " .. vim.fn.expand("%:p")
    vim.cmd(":w")
    vim.cmd([[:set sb]])
    vim.cmd("split | resize 10 | term " .. run_cmd)
    vim.cmd("startinsert")
  end

end

vim.keymap.set('n', '<leader>re', execute_code, {})

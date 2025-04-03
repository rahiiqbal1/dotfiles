vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- J and K move block in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- Cursor stays in middle when doing J
vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- ctrlD and U keep cursor in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv") -- Keeps cursor in the middle during searches

vim.keymap.set("x", "<leader>p", "\"_dP") -- Keeps foo in register when pasting over a highlighted bar

vim.keymap.set("n", "<leader>y", "\"+y") -- leader y yanks to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d") -- leader d deletes to void instead of overwriting copy register
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- Uses tmux to switch projects
-- vim.keymap.set("n", "<leader>f", function()
--     vim.lsp.buf.format()
-- end)

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz") -- quickfix navigation
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz") -- quickfix navigation
vim.keymap.set("n", "<leader>q", "<cmd>cclose<CR>") -- quickfix navigation
vim.keymap.set("n", "<leader>lj", "<cmd>lnext<CR>zz") -- loclist navigation
vim.keymap.set("n", "<leader>lk", "<cmd>lprev<CR>zz") -- loclist navigation
vim.keymap.set("n", "<leader>lq", "<cmd>lclose<CR>") -- loclist navigation

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- leader s opens for replacement of current word below cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- leader x makes the current file executable

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>"); -- Something with packer

vim.keymap.set("n", "<leader><leader>", function() -- sources current file
    vim.cmd("source")
end)

vim.keymap.set("n", "<leader>pm", "<cmd>MarkdownPreview<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fast buffer switching
vim.keymap.set("n", "<leader>n", ":bn<CR>");
vim.keymap.set("n", "<leader>p", ":bp<CR>");

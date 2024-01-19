local g = vim.g

g["test#strategy"] = "neovim_sticky"
g["test#neovim#term_position"] = "vertical rightb"

vim.keymap.set("t", "<C-o>", "<C-\\><C-n>")

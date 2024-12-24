-- Not horribly exit keybind
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Shortcut and Prettification
vim.api.nvim_create_augroup("TerminalStuff", {})
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	group = "TerminalStuff",
	callback = function()
		vim.opt.nu = false
		vim.opt.relativenumber = false
	end,
})

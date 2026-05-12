require("nvim-treesitter").setup({
	ensure_installed = { "javascript", "typescript", "c", "lua", "python" },
	auto_install = false,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

vim.keymap.set("n", "<C-e>", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, { noremap = true, silent = false, desc = "Inspect Colors Under Cursor" })

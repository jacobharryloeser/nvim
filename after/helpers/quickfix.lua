vim.keymap.set("n", "<leader>qfo", function()
	vim.api.nvim_cmd({ cmd = "copen" }, {})
end, { desc = "Open QuickFix List" })

vim.keymap.set("n", "<leader>qfs", function()
	vim.ui.input({ prompt = "Enter Command: ", completion = "command" }, function(input)
		if input == nil or input == "" then
			return
		end
		local formattedInput = string.gsub("system(\u{0022}$command\u{0022})", "%$(%w+)", input)
		vim.api.nvim_cmd({ cmd = "cexpr", args = { formattedInput } }, {})
		vim.api.nvim_cmd({ cmd = "copen" }, {})
	end)
end, { desc = "Open QuickFix List" })

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({})
end, { desc = "Find all of the files" })

vim.keymap.set("n", "<C-p>ff", builtin.git_files, { desc = "Find all source controlled files. Not used often." })

vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep({})
end, { desc = "Ripgrep through file content" })

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Lets search the Help Docs" })

vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Look at hella buffers" })

vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Ripgrep through file content without live updates" })

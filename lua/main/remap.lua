vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Fast buffer switching
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>p", ":bp<CR>")

local function scratch()
	local output = {}

	local function write_to_scratch(_, data, _)
		for k, v in pairs(data) do
			table.insert(output, v)
		end
	end

	local function flush()
		local buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
		local win = vim.api.nvim_get_current_win()
		vim.cmd("vsplit")
		vim.api.nvim_win_set_buf(win, buf)
	end

	vim.ui.input({ prompt = "enter command> ", completion = "command" }, function(input)
		if input == nil then
			return
		elseif input == "scratch" then
			input = "echo('')"
		end
		print("Running your command, so do some push ups and some squats.")
		vim.fn.jobstart(input, { on_exit = flush, on_stdout = write_to_scratch, on_stderr = write_to_scratch })
	end)
end

vim.keymap.set("n", "<leader>sc", scratch, { desc = "Command to scratch buffer sync mode" })

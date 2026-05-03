local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Beautiful Highlighting and ASTs
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
	},

	-- Key Shortcut Reminder
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	-- Surround Text Selections
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
	},

	-- Super Git
	{ "tpope/vim-fugitive" },

	-- Formatter
	{ "mhartington/formatter.nvim" },
})

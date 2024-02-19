-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			function()
				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--edition 2021" },
					stdin = true,
				}
			end,
		},

		zig = {
			require("formatter.filetypes.zig"),
		},

		html = {
			require("formatter.filetypes.html").prettier("html"),
		},

		css = {
			require("formatter.filetypes.html").prettier("css"),
		},

		json = {
			require("formatter.filetypes.json").prettier("json"),
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Lets Format on write
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	pattern = { "*.lua", "*.zig", "*.rs", "*.json", "*.html", "*.css" },
	group = "__formatter__",
	command = ":FormatWrite",
})

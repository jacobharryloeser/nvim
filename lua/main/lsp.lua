vim.lsp.config["lua_ls"] = {
	cmd = { "/home/jacobharryloeser/.config/nvim/dependencies/lsp/lua-language-server/bin/lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.lsp.enable("lua_ls")

-- Unfortunately installed globally via npm instead of as a local binary
-- npm i -g typescript-language-server typescript
vim.lsp.config["tsserver"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript" },
	root_marker = { ".git", "package.json", "tsconfig.json" },
}

vim.lsp.enable("tsserver")

vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_marker = { ".git", ".clangd", "compile_commands.json" },
}

vim.lsp.enable("clangd")

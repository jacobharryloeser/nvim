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

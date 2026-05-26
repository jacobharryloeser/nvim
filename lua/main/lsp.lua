vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, remap = false }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("keep", opts, { desc = "Go To Definition" }))
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, vim.tbl_extend("keep", opts, { desc = "Hover" }))
		vim.keymap.set(
			"n",
			"<leader>vws",
			vim.lsp.buf.workspace_symbol,
			vim.tbl_extend("keep", opts, { desc = "Workspace Symbol" })
		)
		vim.keymap.set(
			"n",
			"<leader>vd",
			vim.diagnostic.open_float,
			vim.tbl_extend("keep", opts, { desc = "Open Float" })
		)
		vim.keymap.set(
			"n",
			"[d",
			vim.diagnostic.goto_next,
			vim.tbl_extend("keep", opts, { desc = "GoTo Next Diagnostic" })
		)
		vim.keymap.set(
			"n",
			"]d",
			vim.diagnostic.goto_prev,
			vim.tbl_extend("keep", opts, { desc = "GoTo Prev Diagnostic" })
		)
		vim.keymap.set(
			"n",
			"<leader>vca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("keep", opts, { desc = "Code Action" })
		)
		vim.keymap.set(
			"n",
			"<leader>vrr",
			vim.lsp.buf.references,
			vim.tbl_extend("keep", opts, { desc = "References" })
		)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, vim.tbl_extend("keep", opts, { desc = "Rename Symbol" }))
		vim.keymap.set(
			"i",
			"<C-h>",
			vim.lsp.buf.signature_help,
			vim.tbl_extend("keep", opts, { desc = "Rename Symbol" })
		)
	end,
})

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
				library = { vim.env.VIMRUNTIME },
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

vim.opt.completeopt = { "menuone", "noselect", "noinsert", "popup" }
vim.lsp.config("*", {
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/completion", bufnr) then
			vim.lsp.completion.enable(true, client.id, bufnr, {
				autotrigger = true,
			})
		end
	end,
})

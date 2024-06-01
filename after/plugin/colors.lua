function SetTheme()
	vim.o.termguicolors = true
	local config = require("synthwave84.theme").load()
	local highlights = require("synthwave84.highlights")

	highlights.set_highlights(config.glow)
	vim.cmd.colorscheme("synthwave84")
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#ff7edb" })
	vim.api.nvim_set_hl(0, "Whitespace", { fg = "#791e94" })
end

SetTheme()

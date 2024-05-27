function ColorMyPencils()
	vim.o.termguicolors = true
	local config = require("synthwave84.theme").load()
	local highlights = require("synthwave84.highlights")

	highlights.set_highlights(config.glow)
	vim.cmd.colorscheme("synthwave84")
end

ColorMyPencils()

function ColorMyPencils()
	vim.o.termguicolors = true
	vim.cmd.colorscheme("synthwave84")
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#ff7edb" })
end

ColorMyPencils()

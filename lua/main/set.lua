vim.opt.guicursor = ""

-- Line Number Plus Relative Offset
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.list = true
local space = "."
vim.opt.listchars:append({
	tab = "|-",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space,
})

vim.opt.tabstop = 4
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Let Tree-sitter do this
vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "PMenu", { bg = "#000000", blend = 50 })
vim.g.mapleader = " "

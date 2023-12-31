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
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Dope Theming
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Beautiful Highlighting and ASTs
    {
    	'nvim-treesitter/nvim-treesitter',
    	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    	build = ":TSUpdate",
    },

    -- Surround Text Selections
    {
    	'kylechui/nvim-surround',
    	version = '*',
    	event = 'VeryLazy',
    },

    -- DAP (Debugging)
    { 'mfussenegger/nvim-dap' },
    -- JS Debugging
    {
    	'microsoft/vscode-js-debug',
    	build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
    },
    { 'mxsdev/nvim-dap-vscode-js' },

    -- LSP Section
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
}, {
	git = {
		timeout = 300,
	},
})

return {
	"nvim-lua/plenary.nvim",

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-telescope/telescope.nvim", tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ "nvim-tree/nvim-web-devicons", opts = {} },

  	{ "hrsh7th/cmp-path"},
  	{ "hrsh7th/cmp-buffer"},
  	{ "hrsh7th/cmp-omni"},
  	{ "hrsh7th/cmp-cmdline"},

	"williamboman/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",

	"lewis6991/gitsigns.nvim",
	{'akinsho/git-conflict.nvim', version = "*", config = true},

	"nvim-tree/nvim-tree.lua",

	{
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
        		-- Optionally configure and load the colorscheme
        		-- directly inside the plugin declaration.
        		vim.g.everforest_enable_italic = true
        		vim.cmd.colorscheme('everforest')
      		end
    	}
}

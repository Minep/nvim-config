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
	    "folke/todo-comments.nvim",
	    dependencies = { "nvim-lua/plenary.nvim" },
	    opts = {
		    -- your configuration comes here
		    -- or leave it empty to use the default settings
		    -- refer to the configuration section below
	    }
	},

	{
	  "folke/trouble.nvim",
	  opts = {}, -- for default options, refer to the configuration section for custom setup.
	  cmd = "Trouble",
	},

	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  },
	  keys = {
	    {
	      "<leader>?",
	      function()
		require("which-key").show({ global = false })
	      end,
	      desc = "Buffer Local Keymaps (which-key)",
	    },
	  },
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
}

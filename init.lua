vim.g.mapleader = '\\'

require("commands")
require("config.lazy")

require("base-vim")

local cmp = require('cmp')
local cmplsp = require("cmp_nvim_lsp")
local keydef = require("keys")
local nvtreeFn = require("functions.nvim-tree")

require("nvim-tree").setup({
	view = {
		width = 30
	},
	renderer = {
	    root_folder_label = nvtreeFn.format_root_folder
	}
})

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
    		documentation = cmp.config.window.bordered()
  	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = "buffer" },
	}),
	mapping = cmp.mapping.preset.insert({
        	['<C-d>'] = cmp.mapping.scroll_docs(-4),
        	['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
        	['<C-Space>'] = cmp.mapping.complete(),
        	['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
})



require("mason").setup()

vim.lsp.config("*", {
	capabilities = cmplsp.default_capabilities(),
	flags = {
    		debounce_text_changes = 500,
  	}
})

require("mason-lspconfig").setup({
	hanlders = {
		function(name)
			vim.lsp.enable(name)
		end,
	},
})


require('gitsigns').setup({
	current_line_blame = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    keydef.applyKey("lspAttach", function (m, l, r, o)
    	o["buffer"] = true
	vim.keymap.set(m, l, r, o)
    end)
  end
})

local builtin = require('telescope.builtin')
keydef.applyKey("telescope", function (m, l, r, o)
	vim.keymap.set(m, l, r(builtin), o)
end)

keydef.applyKeyDefault("vimkey")
keydef.applyKeyDefault("trouble")


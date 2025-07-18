require("config.lazy")

vim.api.nvim_set_option("clipboard", "unnamed")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.wo.cursorline = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.smarttab = true
vim.bo.expandtab = true


--if vim.fn.getcwd() == "/home/lxsky/projects/negative-97-tex" then
--	vim.go.columns = 150
--end

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local cmplsp = require("cmp_nvim_lsp")
local select_opts = {behavior = cmp.SelectBehavior.Select}
local cmp_caps = cmplsp.default_capabilities()

require("transparent").setup({
	extra_groups = {
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"NvimTreeNormal" -- NvimTree
	}
})

require("nvim-tree").setup({
	view = {
		width = 30
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
	capabilities = cmp_caps,
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
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fd', function()
	builtin.lsp_document_symbols({ symbols='function' })
end, { desc = "List functions" })

vim.keymap.set({'n', 'v'}, '<Del>', '"_x')

vim.keymap.set({'n', 'v'}, '<S-Up>', '<Up>')
vim.keymap.set({'n', 'v'}, '<S-Down>', '<Down>')
vim.keymap.set({'n', 'v'}, '<Up>', 'gk')
vim.keymap.set({'n', 'v'}, '<Down>', 'gj')

vim.keymap.set({'i'}, '<S-Up>', '<Up>')
vim.keymap.set({'i'}, '<S-Down>', '<Down>')
vim.keymap.set({'i'}, '<Up>', '<C-o>gk')
vim.keymap.set({'i'}, '<Down>', '<C-o>gj')

vim.keymap.set({'n'}, '\\[', '<C-o>')
vim.keymap.set({'n'}, '\\]', '<C-i>')

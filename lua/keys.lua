local __key_defs = {
    lspAttach = {
        {
	    mode = 'n',
	    lhs  = 'K',
	    rhs  = '<cmd>lua vim.lsp.buf.hover()<cr>',
	    desc = 'Displays hover information about the symbol under the cursor',
	},{
	    mode = 'n',
	    lhs  = 'gd',
	    rhs  = '<cmd>lua vim.lsp.buf.definition()<cr>',
	    desc = 'Jump to the definition',
	},{
	    mode = 'n',
	    lhs  = 'gD',
	    rhs  = '<cmd>lua vim.lsp.buf.declaration()<cr>',
	    desc = 'Jump to declaration',
	},{
	    mode = 'n',
	    lhs  = 'gi',
	    rhs  = '<cmd>lua vim.lsp.buf.implementation()<cr>',
	    desc = 'Lists all the implementations for the symbol under the cursor',
	},{
	    mode = 'n',
	    lhs  = 'go',
	    rhs  = '<cmd>lua vim.lsp.buf.type_definition()<cr>',
	    desc = 'Jumps to the definition of the type symbol',
	},{
	    mode = 'n',
	    lhs  = 'gr',
	    rhs  = '<cmd>lua vim.lsp.buf.references()<cr>',
	    desc = 'Lists all the references',
	},{
	    mode = 'n',
	    lhs  = 'gs',
	    rhs  = '<cmd>lua vim.lsp.buf.signature_help()<cr>',
	    desc = 'Displays a function\'s signature information',
	},{
	    mode = 'n',
	    lhs  = '<F2>',
	    rhs  = '<cmd>lua vim.lsp.buf.rename()<cr>',
	    desc = 'Renames all references to the symbol under the cursor',
	},{
	    mode = 'n',
	    lhs  = '<F4>',
	    rhs  = '<cmd>lua vim.lsp.buf.code_action()<cr>',
	    desc = 'Selects a code action available at the current cursor position',
	},{
	    mode = 'n',
	    lhs  = 'gl',
	    rhs  = '<cmd>lua vim.diagnostic.open_float()<cr>',
	    desc = 'Show diagnostics in a floating window',
	},{
	    mode = 'n',
	    lhs  = '[d',
	    rhs  = '<cmd>lua vim.diagnostic.goto_prev()<cr>',
	    desc = 'Move to the previous diagnostic',
	},{
	    mode = 'n',
	    lhs  = ']d',
	    rhs  = '<cmd>lua vim.diagnostic.goto_next()<cr>',
	    desc = 'Move to the next diagnostic',
	},
    },

    telescope = {
        {
            mode = 'n',
            lhs = '<leader>ff',
            rhs = function(ts) return ts.find_files end,
            desc = 'Telescope: Find file'
        },{
            mode = 'n',
            lhs = '<leader>fg',
            rhs = function(ts) return ts.live_grep end,
            desc = 'Telescope: Live Grep'
        },{
            mode = 'n',
            lhs = '<leader>fb',
            rhs = function(ts) return ts.buffers end,
            desc = 'Telescope: Find in Buffers'
        },{
            mode = 'n',
            lhs = '<leader>fh',
            rhs = function(ts) return ts.help_tags end,
            desc = 'Telescope: '
        },{
            mode = 'n',
            lhs = '<leader>fd',
            rhs = function(ts)
                    return function()
			ts.lsp_document_symbols({
			    symbols='function'
			})
		    end
                  end,
            desc = 'Telescope: Search function definitions'
        },
    },

    trouble = {
        {
            mode = 'n',
            lhs="<leader>xx",
            rhs="<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            mode = 'n',
            lhs="<leader>xX",
            rhs="<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            mode = 'n',
            lhs="<leader>cs",
            rhs="<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            mode = 'n',
            lhs="<leader>cl",
            rhs="<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            mode = 'n',
            lhs="<leader>xL",
            rhs="<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            mode = 'n',
            lhs="<leader>xQ",
            rhs="<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        }
    },

    vimkey = {
        {
            mode = {'n', 'v'},
            lhs = '<Del>',
            rhs = '_x',
        },{
            mode = {'n', 'v'},
            lhs = '<S-Up>',
            rhs = '<Up>',
        },{
            mode = {'n', 'v'},
            lhs = '<S-Down>',
            rhs = '<Down>',
        },{
            mode = {'n', 'v'},
            lhs = '<Up>',
            rhs = 'gk',
        },{
            mode = {'n', 'v'},
            lhs = '<Down>',
            rhs = 'gj',
        },{
            mode = 'i',
            lhs = '<S-Up>',
            rhs = '<Up>',
        },{
            mode = 'i',
            lhs = '<S-Down>',
            rhs = '<Down>',
        },{
            mode = 'i',
            lhs = '<Up>',
            rhs = '<C-o>gk',
        },{
            mode = 'i',
            lhs = '<Down>',
            rhs = '<C-o>gj',
        },{
            mode = 'n',
            lhs = '\\[',
            rhs = '<C-o>',
        },{
            mode = 'n',
            lhs = '\\]',
            rhs = '<C-i>',
        }
    }
}

local get_opt = function (obj)
    local opt = obj.opt or {}
    opt['desc'] = obj.desc or ''
    return opt
end

return {
    applyKey = function (scope, install_hook)
        local ls = __key_defs[scope]
        for i, obj in ipairs(ls) do
            local opt = get_opt(obj)
            install_hook(obj.mode, obj.lhs, obj.rhs, opt)
        end
    end,

    applyKeyDefault = function (scope)
        local ls = __key_defs[scope]
        for i, obj in ipairs(ls) do
            local opt = get_opt(obj)
            vim.keymap.set(obj.mode, obj.lhs, obj.rhs, opt)
        end
    end
}

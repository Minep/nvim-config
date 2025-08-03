-- wo --
vim.wo.number = true
vim.wo.cursorline = true

-- bo --

-- opt --
vim.opt.termguicolors = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true


-- g --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.tex_flavor = "latex"

-- api --
vim.api.nvim_set_option("clipboard", "unnamed")

-- misc --
vim.go.smarttab = true
vim.go.shiftround = true
vim.go.shiftwidth = 4
vim.go.expandtab = false

vim.foldmethod = "manual"

vim.go.number = true

vim.cmd [[colorscheme moonfly]]

vim.go.wrap = false

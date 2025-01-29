vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.redrawtime = 30000
vim.opt.synmaxcol = 200
vim.opt.scrolljump = 5
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.tabstop = 3


vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- its mean "\"
vim.keymap.set('n', '<C-t>', ':Neotree toggle filesystem reveal right<CR>')

require('config.lazy')

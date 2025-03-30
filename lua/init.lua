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

-- keymap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- its mean "\"
vim.keymap.set('n', '<C-t>', ':Neotree toggle filesystem reveal right<CR>', { desc = "File Manager" })
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>', { desc = "Deselect search" })
vim.keymap.set('n', '<ScrollWheelUp>', 'k')
vim.keymap.set('n', '<ScrollWheelDown>', 'j')
-- vim.keymap.set('i', '<ScrollWheelUp>', '<C-y>')
-- vim.keymap.set('i', '<ScrollWheelDown>', '<C-e>')
vim.keymap.set('v', '<ScrollWheelUp>', 'k')
vim.keymap.set('v', '<ScrollWheelDown>', 'j')

require('config.lazy')

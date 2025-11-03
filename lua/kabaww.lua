-- ### KABAWW'S KEYMAPS AND OTHER SHIT ###

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = false })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = false })
vim.wo.relativenumber = true

vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' })

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = false

vim.api.nvim_create_autocmd({ 'BufReadPost', 'FileReadPost' }, {
  pattern = '*',
  command = 'normal zR',
})

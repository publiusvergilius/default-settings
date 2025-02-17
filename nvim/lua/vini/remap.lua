vim.g.mapleader = ' '

--in normal mode through the leader(space key) execute :Ex
vim.keymap.set('n', '<leader>pe', vim.cmd.Ex)

vim.keymap.set('n', '<leader>ef', vim.diagnostic.open_float, { desc = 'Show float diagnostics' })

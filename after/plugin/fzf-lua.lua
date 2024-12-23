local builtin = require("fzf-lua")

vim.keymap.set('n', '<C-p>', builtin.files, { desc = "Fzf Files" }) 
vim.keymap.set('n', '<leader>g', builtin.git_files, { desc = "FZF git Files" }) 
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "FZF buffer Files" }) 

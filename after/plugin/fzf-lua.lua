local builtin = require("fzf-lua")

-- Improve this keymaps.
-- check if the there is a git project and if there is use git_files instead of files for <C-P>.
vim.keymap.set('n', '<C-p>', builtin.files, { desc = "Fzf Files" }) 
vim.keymap.set('n', '<leader>g', builtin.git_files, { desc = "FZF git Files" }) 
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "FZF buffer Files" }) 

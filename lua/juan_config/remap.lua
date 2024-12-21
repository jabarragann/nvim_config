vim.keymap.set("i", "jk", "<Esc>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- nnn.nvim
vim.keymap.set("n", "<leader>n", ":NnnPicker <CR>")
vim.keymap.set("n", "<leader>t", ":NnnExplorer <CR>")

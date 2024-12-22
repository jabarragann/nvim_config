vim.keymap.set("i", "jk", "<Esc>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Splits remaps
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- nnn.nvim
vim.keymap.set("n", "<leader>n", ":NnnPicker <CR>")
vim.keymap.set("n", "<leader>t", ":NnnExplorer <CR>")


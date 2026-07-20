-- Chat gpt suggestion -> https://chatgpt.com/share/6768f917-3810-8000-af01-9af92d9c03de  
function ReloadRemaps()
    local remap_file = "juan_config.remap"
    package.loaded[remap_file] = nil
    require(remap_file)
    print("remap.lua reloaded!!")
end

-- Base keybindings
vim.keymap.set("i", "jk", "<Esc>")

-- Splits remaps
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move lines up/down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Leader map keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<Space><Space>', ':nohlsearch<Bar>:echo<CR>', { noremap = true, silent = true })


----------------------------------
-- Keybinding to reload config 
----------------------------------

-- vim.keymap.set("n", "<leader>rr", ReloadRemaps, { desc = "Reload remap.lua" }) 
vim.keymap.set("n", "<leader>rr", "<cmd>source %<CR>")

-- Test to see if your file was indeed reloaded
vim.keymap.set("n", "<leader>w","<cmd>echo 'tesring cmd!!'<CR>")



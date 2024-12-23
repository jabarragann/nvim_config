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

-- Leader map keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rr", ReloadRemaps, { desc = "Reload remap.lua" }) -- Keybinding to reload remaps.lua

-- nnn.nvim
vim.keymap.set("n", "<leader>n", ":NnnPicker <CR>") -- In root folder
vim.keymap.set("n", "<leader>l", ":NnnPicker %:p:h<CR>") -- In local folder 
vim.keymap.set("n", "<leader>t", ":NnnExplorer <CR>")


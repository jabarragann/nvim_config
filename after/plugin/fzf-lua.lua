local builtin = require("fzf-lua")

local function project_files()
  vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
  if vim.v.shell_error == 0 then
    builtin.git_files()
  else
    builtin.files()
  end
end

vim.keymap.set("n", "<C-p>", project_files, { desc = "Find project files" })

-- Improve this keymaps.
-- check if the there is a git project and if there is use git_files instead of files for <C-P>.
-- vim.keymap.set('n', '<C-p>', builtin.files, { desc = "Fzf Files" }) 

vim.keymap.set('n', '<leader>g', builtin.git_files, { desc = "FZF git Files" }) 
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "FZF buffer Files" }) 

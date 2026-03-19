-- Additional Notes --
-- Vim offers two wrapping modes: 'soft' and 'hard'. Soft wrapping (enabled by
-- 'wrap') visually wraps lines without inserting actual newline characters,
-- while hard wrapping (enabled by 'textwidth') inserts newline characters at 
-- a specified column.
--
-- Useful commands:
-- gqap - Reflow the current paragraph according to 'textwidth' and 
-- 'formatoptions' in text documents. (NOT working with comments)


local function setup_word_processor()
  local opt = vim.opt_local

  -- Text layout
  opt.wrap = true           -- Wrap text
  opt.linebreak = true      -- Wrap on word boundaries
  opt.breakindent = true    -- Preserve indentation on wrapped lines
  opt.textwidth = 80        -- Soft writing target
  opt.colorcolumn = "80"    -- Visual guide

  -- Spell checking
  opt.spell = true
  opt.spelllang = "en_us"

  -- Better paragraph navigation
  vim.keymap.set("n", "<Down>", "gj", { buffer = true })
  vim.keymap.set("n", "<Up>", "gk", { buffer = true })
  vim.keymap.set("n", "j", "gj", { buffer = true })
  vim.keymap.set("n", "k", "gk", { buffer = true })

  -- Optional writing conveniences
  -- opt.conceallevel = 2      -- Better markdown rendering
  opt.formatoptions:append("t") -- Enable auto line wrapping when typing
  opt.formatoptions:remove("c") -- Don't auto-wrap comments

  -- Disable Copilot for writing buffers
  vim.cmd("Copilot disable")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = setup_word_processor,
})

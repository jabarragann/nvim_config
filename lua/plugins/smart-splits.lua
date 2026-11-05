-- ctrl+h/j/k/l across nvim splits, tmux panes and kitty windows.
-- Not lazy loaded: the backends must mark the pane/window as nvim at startup
-- (tmux: @pane-is-vim, kitty: IS_NVIM user var) or tmux/kitty eat the keys.

-- kitty's neighbor match says top/bottom where smart-splits says up/down
local kitty_dir = { left = "left", right = "right", up = "top", down = "bottom" }

-- Inside tmux, the tmux backend stops at the tmux window edge. Hand focus on
-- to the neighbouring kitty window, unless the tmux pane is zoomed.
local function at_edge(ctx)
  if not (vim.env.TMUX and vim.env.KITTY_LISTEN_ON) then
    return
  end
  local zoomed = vim.fn.system({ "tmux", "display-message", "-p", "#{window_zoomed_flag}" })
  if vim.trim(zoomed) == "1" then
    return
  end
  pcall(vim.system, { "kitten", "@", "focus-window", "--match", "neighbor:" .. kitty_dir[ctx.direction] })
end

return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    "smart-splits-nvim/backend-tmux",
    "smart-splits-nvim/backend-kitty",
  },
  config = function()
    local ss = require("smart-splits")
    ss.setup({
      -- tmux first: inside tmux the kitty backend would also detect
      mux = {
        backend = { "smart-splits-backend-tmux", "smart-splits-backend-kitty" },
        warn_if_unusable = false,
      },
      move = { at_edge = at_edge },
    })

    vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
    vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
    vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
    vim.keymap.set("n", "<C-l>", ss.move_cursor_right)
  end,
}

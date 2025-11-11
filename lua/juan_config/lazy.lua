-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct. (done in remaps.lua)
-- This is also a good place to setup other settings (vim.opt)

-- Load different version of the plugins depending on the ubuntu version
local function get_lockfile_path()
  local default = vim.fn.stdpath("config") .. "/lazy-lock.json"
  local uname = vim.loop.os_uname()

  if uname.sysname ~= "Linux" then
    return default
  end

  local handle = io.popen("lsb_release -rs 2>/dev/null")
  local version = handle and handle:read("*l") or ""
  if handle then handle:close() end

  if version:match("^20%.04") then
    return vim.fn.stdpath("config") .. "/lazy-lock-frozen/lazy-lock-nvim0.10-ubuntu20.04_test.json"
  end

  return default
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  -- Ensure lockfile exists or else a new one will be created.
  lockfile = get_lockfile_path(), 
  -- lockfile = vim.fn.stdpath("config") .. "/lazy-lock-frozen/lazy-lock-nvim0.10-ubuntu20.04_test.json"
})


-- Optional helper commands for quick switching
-- Also for testing which file is loaded
-- :lua print(require("lazy.core.config").options.lockfile)


-- FAILED EXPERIMENT:
-- It seems like at setup the file selected is loaded and
-- then changing the file will result on overwritting
-- the different lock-files
--
-- vim.api.nvim_create_user_command("LazyUseLegacy", function()
--   local cfg = require("lazy.core.config")
--   local lockfile = vim.fn.stdpath("config")
--     .. "/lazy-lock-frozen/"
--     .. "lazy-lock-nvim0.10-ubuntu20.04_test.json"
--   cfg.options.lockfile = lockfile
--   vim.cmd("Lazy restore")
-- end, {})
--
-- vim.api.nvim_create_user_command("LazyUseCurrent", function()
--   local cfg = require("lazy.core.config")
--   local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
--   cfg.options.lockfile = lockfile
--   vim.cmd("Lazy restore")
-- end, {})

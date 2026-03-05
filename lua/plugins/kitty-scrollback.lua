return {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    version = '^9.2.0', -- pin major version, include fixes and features that do not have breaking changes
    -- kitty <0.43.0 requires 7.0.0
    config = function()
      require('kitty-scrollback').setup()
    end,
  }

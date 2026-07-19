return {
    { "tpope/vim-fugitive"},
    -- Enables :GBrowse -- See: https://github.com/tpope/vim-fugitive/issues/2309
    {"tpope/vim-rhubarb"},
    -- Nav shortcuts --
    {"tpope/vim-unimpaired"},
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }
}


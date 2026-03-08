return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
        }},
    -- LSP completion
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {
      "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
          bind = true,
          handler_opts = {
            border = "rounded",
          },
        },
      },
}


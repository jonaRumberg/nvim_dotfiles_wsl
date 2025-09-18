return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {},
    },
    {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            -- OR 'ibhagwan/fzf-lua',
            -- OR 'folke/snacks.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            enable_builtin = true,
            default_to_project_v2 = true,
            picker = "telescope",
        },
    }
}

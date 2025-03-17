return {
    'stevearc/aerial.nvim',
    opts = {},
    keys = {
        {"<leader>at", "<cmd>AerialToggle!<CR>", desc = "Toggle aerial"}
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
}

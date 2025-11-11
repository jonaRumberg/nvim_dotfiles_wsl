return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons"
    },
	opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-k>"] = "cycle_history_next",
                    ["<C-l>"] = "cycle_history_prev",
                }
            }
        },
    }
}

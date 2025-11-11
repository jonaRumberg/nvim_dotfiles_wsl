return {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    ---@module 'undotree.collector'
    ---@type UndoTreeCollector.Opts
    opts = {
    },
    keys = {
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}

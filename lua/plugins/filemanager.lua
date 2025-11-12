return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        integrations = {
            icon = "nvim_web_devicons"
        },
        views = {
            finder = {
                default_explorer = true,
                watcher = {
                    enabled = true,
                },
                mappings = {
                    ["-"] = "CollapseNode"
                },
                git_status = {
                    enabled = true,
                    symbols = {
                        Modified = "●",
                        Added = "✚",
                        Deleted = "✖",
                        Untracked = "U",
                        Ignored = "",
                    },
                },
            },
        },
    },
}

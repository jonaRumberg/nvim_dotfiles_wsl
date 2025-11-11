return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-jest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestArguments = function(defaultArguments, context)
                        return defaultArguments
                    end,
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                    isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
                }),
            }
        })
        vim.api.nvim_set_keymap('n', '<leader>tr', "<cmd>lua require('neotest').run.run()<CR>", { noremap = true, silent = true })
    end
}


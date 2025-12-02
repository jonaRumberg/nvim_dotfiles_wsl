return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "claude-sonnet-4.5",
            window = {
                layout = "float",
                relative = "editor",
                width = 0.8,
                height = 0.8,
                border = "rounded",
            },
            mappings = {
                close = {
                    normal = "q",
                    insert = "<C-c>",
                },
                reset = {
                    normal = "<C-r>",
                    insert = "<C-r>",
                },
                submit_prompt = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
            },
        },
        keys = {
            -- Toggle chat window
            { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
            -- Quick chat with input
            { "<leader>cq", function()
                local input = vim.fn.input("Quick Chat: ")
                if input ~= "" then
                    require("CopilotChat").ask(input)
                end
            end, desc = "Quick Chat" },
            -- Explain code
            { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain Code" },
            -- Review code
            { "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review Code" },
            -- Fix code
            { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix Code" },
            -- Optimize code
            { "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize Code" },
            -- Generate docs
            { "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Generate Docs" },
            -- Generate tests
            { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Generate Tests" },
            -- Commit message for staged changes
            { "<leader>cm", "<cmd>CopilotChatCommit<cr>", desc = "Generate Commit Message" },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        version = '*',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
}

return {
    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false,
        opts = {
            provider = "copilot",
            providers = {
                copilot = {
                    endpoint = "https://api.githubcopilot.com",
                    model = "claude-sonnet-4.5",
                    timeout = 30000,
                },
            },
            mappings = {
                ask = "<leader>aa",
                edit = "<leader>ae",
                refresh = "<leader>ar",
                toggle = {
                    default = "<leader>at",
                    debug = "<leader>ad",
                    hint = "<leader>ah",
                    suggestion = "<leader>as",
                    repomap = "<leader>aR",
                },
                sidebar = {
                    switch_windows = "<Tab>",
                    reverse_switch_windows = "<S-Tab>",
                },
            },

            ---------------- MCP HUB INTEGRATION -----
            -- system_prompt as function ensures LLM always has latest MCP server state
            -- This is evaluated for every message, even in existing chats
            system_prompt = function()
                local hub = require("mcphub").get_hub_instance()
                return hub and hub:get_active_servers_prompt() or ""
            end,
            -- Using function prevents requiring mcphub before it's loaded
            custom_tools = function()
                return {
                    require("mcphub.extensions.avante").mcp_tool(),
                }
            end,

        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "ravitemer/mcphub.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- MCP Hub will auto-detect and integrate with avante.nvim
            extensions = {
                avante = {
                    make_slash_commands = true,
                },
            },
        },
        keys = {
            { "<leader>mo", "<cmd>MCPHub<cr>", desc = "Open MCP Hub" },
            { "<leader>ms", "<cmd>MCPHub servers<cr>", desc = "MCP Servers" },
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

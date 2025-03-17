return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function ()

        local dap = require("dap")

        dap.adapters.node2 = {
            type = "executable",
            command = "node-debug2-adapter",
            args = {}
        }

        dap.configurations.cds = {
            {
                type = "node2",
                request = "attach",
                name = "Attach to cds watch with debug flag",
            }
        }

        dap.configurations.javascript = {
            {
                type = "node2",
                request = "attach",
                name = "Attach to cds watch with debug flag",

            }
        }

        -- configure ui to open on attach
        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- set up icons
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })

        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStoppedDapStopped", linehl = "", numhl = "" })

        -- set up keymappings
        local opts = { noremap = true, silent = true };
        vim.api.nvim_set_keymap("n", "<Leader>da", "<CMD>lua require('dap').continue()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>du", "<CMD>lua require('dapui').open()<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dapui').close()<CR>", opts)

        vim.api.nvim_set_keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
        vim.api.nvim_set_keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)
    end
}

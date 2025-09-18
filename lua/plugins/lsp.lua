return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"mason.nvim",
            { "williamboman/mason-lspconfig.nvim", tag="v1.31.0"}
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})

            local conf = require('lspconfig')

            conf.ts_ls.setup {}

            conf.cds_lsp.setup {}

            conf.clangd.setup {}

            conf.lua_ls.setup {}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "L", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end
    },
	-- mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason"
	}
}

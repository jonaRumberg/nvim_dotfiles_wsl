return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})

            local conf = require('lspconfig')

            conf.ts_ls.setup {}

            conf.cds_lsp.setup {}

            conf.clangd.setup {}

            conf.lua_ls.setup {}
        end
    },
	-- mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason"
	}
}

-- this is the most important setting
vim.cmd('set langmap=jh,kj,lk,öl')

-- this is the second most important setting
vim.api.nvim_set_keymap("i", "JK", "<Esc>", { noremap = true, silent = true })

-- make window management a little more comfortable
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true, silent = true })

-- this is the second most important setting
vim.api.nvim_set_keymap("i", "JK", "<Esc>", { noremap = true, silent = true })

-- make window management a little more comfortable
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true, silent = true })

-- lsp key remaps
vim.api.nvim_set_keymap("n", "gd", "<C-]>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

-- oil remap
vim.api.nvim_set_keymap("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.api.nvim_set_keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


-- terminal keymaps
vim.keymap.set('n', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")
vim.keymap.set('v', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")
vim.keymap.set('i', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")

require("toggleterm").setup()
local opts = {buffer = 0}

function _G.set_terminal_keymaps()
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'JK', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-l>', "<Up>", opts)
	vim.keymap.set('t', '<C-k>', "<Down>", opts)

	vim.keymap.set('t', '<C-j>', "<cmd>ToggleTerm<cr>", opts)
end

--
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

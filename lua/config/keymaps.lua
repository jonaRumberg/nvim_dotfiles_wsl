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

-- fyler remap
vim.api.nvim_set_keymap("n", "<leader>pv", "<CMD>Fyler<CR>", { desc = "Open parent directory" })
vim.api.nvim_set_keymap("n", "-", "<CMD>Fyler<CR>", { desc = "Open parent directory" })

-- half jump
vim.keymap.set('n', '<C-k>', "<C-d>")
vim.keymap.set('n', '<C-l>', "<C-u>")

-- search and replace
vim.keymap.set('n', '<leader>s', ":%s/")

-- terminal keymaps
vim.keymap.set('n', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")
vim.keymap.set('v', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")
vim.keymap.set('i', '<C-j>', "<cmd>ToggleTerm direction=vertical size=100<cr>")

-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pa', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Telescope resume' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })

-- limelight
vim.keymap.set("n", "<leader>hs", ":Limelight!!<CR>");
vim.keymap.set("v", "<leader>hs", ":Limelight!!<CR>");

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

vim.opt.nu = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

-- tab options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- relative line numbers
vim.opt.rnu = true

-- persistent undo
vim.opt.undofile = true

-- sync clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"

-- autocommands
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cds" },
    command = "set filetype=cds",
})

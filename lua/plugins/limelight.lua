return {
    "junegunn/limelight.vim",
    config = function ()
        vim.keymap.set("n", "<leader>hs", ":Limelight!!<CR>");
        vim.keymap.set("v", "<leader>hs", ":Limelight!!<CR>");
    end
}

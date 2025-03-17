return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function ()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true }
            })

            -- Install tree-sitter-cds for syntax highlighting
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.cds = {
                install_info = {
                    -- local path or git repo
                    -- url = '/path/to/tree-sitter-cds',
                    url = "https://github.com/cap-js-community/tree-sitter-cds.git",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "cds",
                -- additional filetypes that use this parser
                used_by = { "cdl", "hdbcds" },
            }
        end
    },
}

 ---@module 'config.lazy'
return {
    'saghen/blink.cmp',
	event = "BufEnter",
    version = 'v0.*',

    opts = {
        appearance = {
            nerd_font_variant = 'mono',
            use_nvim_cmp_as_default = true,
        },

        keymap = {
            preset = 'default',
              ['<CR>'] = {'accept', 'fallback'},
              ['<Tab>'] = {'select_next', 'fallback'},
              ['<S-Tab>'] = {'select_prev', 'fallback'},

        },
        cmdline = {
            keymap = {
                ['<CR>'] = {'accept_and_enter', 'fallback'},
            }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    }
}

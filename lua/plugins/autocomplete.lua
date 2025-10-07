 ---@module 'config.lazy'
return {
    'saghen/blink.cmp',
	event = "BufEnter",
    version = 'v0.*',

    opts = {
        appearance = {
            nerd_font_variant = 'mono',
        },

        keymap = {
            preset = 'default',
              ['<CR>'] = {'accept', 'fallback'},
              ['<C-k>'] = {'select_next', 'fallback'},
              ['<C-l>'] = {'select_prev', 'fallback'},
              ['<esc>'] = {'cancel', 'fallback'}

        },
        cmdline = {
            keymap = {
                ['<CR>'] = {'accept', 'fallback'},
                ['<C-k>'] = {'select_next', 'fallback'},
                ['<C-l>'] = {'select_prev', 'fallback'},
                ['<esc>'] = {'cancel', 'fallback'}
            }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    }
}

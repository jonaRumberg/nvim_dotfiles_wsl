 ---@module 'config.lazy'
return {
    'saghen/blink.cmp',
	event = "BufEnter",
    build = "cargo build --release",
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
            default = { 'lsp', 'path', 'snippets', 'buffer', "copilot" },
            providers = {
                path = {
                    -- disable conflicting autocomplete with CopilotChat
                    enable = function ()
                        return vim.bo.filetype ~= "copilot-chat"
                    end,
                },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(ctx, items)
                        for _, item in ipairs(items) do
                            item.kind_icon = ' '
                            item.kind_name = 'Copilot'
                        end
                        return items
                    end
                },
            },
        },
    },
    dependencies = {
        "giuxtaposition/blink-cmp-copilot",
    }
}

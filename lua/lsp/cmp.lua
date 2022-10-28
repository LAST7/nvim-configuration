local lspkind = require('lspkind')
local cmp = require('cmp')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup {
        -- select a snippet engine
        snippet = {
                expand = function(args)
                        -- For `vsnip` users.
                        vim.fn["vsnip#anonymous"](args.body)

                        -- For `luasnip` users.
                        -- require('luasnip').lsp_expand(args.body)

                        -- For `ultisnips` users.
                        -- vim.fn["UltiSnips#Anon"](args.body)

                        -- For `snippy` users.
                        -- require'snippy'.expand_snippet(args.body)
                end,
        },
        -- sources
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- For vsnip users.
                { name = 'vsnip' },
                -- For luasnip users.
                -- { name = 'luasnip' },
                --For ultisnips users.
                -- { name = 'ultisnips' },
                -- -- For snippy users.
                -- { name = 'snippy' },
                }, { { name = 'buffer' },
                        { name = 'path' }
                }),


        -- Keyboard bindings
        mapping = require("keybindings").cmp(cmp),
        -- use lspkind-nvim to display type icon
        formatting = {
                format = lspkind.cmp_format({
                        with_text = true, -- do not show text alongside icons
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        before = function (entry, vim_item)
                                -- display Source
                                vim_item.menu = "["..string.upper(entry.source.name).."]"
                                return vim_item
                        end
                })
        },
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
        sources = {
                { name = 'buffer' }
        }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
                { name = 'path' }
        }, {
                { name = 'cmdline' }
        })
})

-- Add mapping 'CR' for autopairs
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    }),
    -- mapping = {
    --     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --     ["<C-e>"] = cmp.mapping.close(),
    --     ["<c-y>"] = cmp.mapping.confirm {
    --       behavior = cmp.ConfirmBehavior.Insert,
    --       select = true,
    --     },
    --     ["<c-q>"] = cmp.mapping.confirm {
    --       behavior = cmp.ConfirmBehavior.Replace,
    --       select = true,
    --     },

    --     ["<c-space>"] = cmp.mapping.complete(),
    -- },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

    formatting = {
      format = lspkind.cmp_format({with_text = true, menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
        })}),
    },
})

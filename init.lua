require('plugins')

local vc = vim.cmd

local nnoremap = function(lhs, rhs)
    vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end

vim.g.mapleader = ' '

local o = vim.o
local wo = vim.wo

wo.number = true
wo.relativenumber = true

o.hidden = true
o.scrolloff = 3
o.synmaxcol = 256      -- limit number of chars in line that are colorized
o.list = true
o.ignorecase = true      -- ignore search case
o.smartcase = true       -- match upper case when it is specified
o.virtualedit = "all" -- you can move your cursor through every position in text
o.showmode = true        -- show what mode you are in
o.cursorline = true      -- highlight line cursor pos
o.cursorcolumn = true    -- highlight column cursor pos
o.splitbelow = true      -- put new window below when horizontal splitting
o.splitright = true      -- put new window right when vertical splitting
o.expandtab = true       -- replace tabs with spaces
o.tabstop = 4       -- number of spaces to replace tab
o.shiftwidth = 4    -- number of spaces inserted for indentation
o.wildmenu = true
o.undolevels = 2048
o.background = "dark"


vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

local on_attach = function(client)
    require'completion'.on_attach(client)
end

local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup{
    on_attach=on_attach,
}

require('plugins')
require('completion')

vim.g.mapleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.hidden = true
vim.o.scrolloff = 3
vim.o.synmaxcol = 256      -- limit number of chars in line that are colorized
vim.o.list = true
vim.o.ignorecase = true      -- ignore search case
vim.o.smartcase = true       -- match upper case when it is specified
vim.o.virtualedit = "all" -- you can move your cursor through every position in text
vim.o.showmode = true        -- show what mode you are in
vim.o.cursorline = true      -- highlight line cursor pos
vim.o.cursorcolumn = true    -- highlight column cursor pos
vim.o.splitbelow = true      -- put new window below when horizontal splitting
vim.o.splitright = true      -- put new window right when vertical splitting
vim.o.expandtab = true       -- replace tabs with spaces
vim.o.tabstop = 4       -- number of spaces to replace tab
vim.o.shiftwidth = 4    -- number of spaces inserted for indentation
vim.o.wildmenu = true
vim.o.undolevels = 2048
vim.o.background = "dark"
vim.o.mouse = "a" -- enable mouse support

-- create a function to cycle through selected colorschemes
vim.cmd('colorscheme onedark')

-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup {}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

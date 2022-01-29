vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

local nvim_lsp = require'lspconfig'

nvim_lsp.pyright.setup {}

-- TODO: figure out how to use company in house tools for linting/formatting
nvim_lsp.efm.setup {
    init_options = {documentFormatting = true, completion = false},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                { formatCommand = 'black --quiet -', formatStdin = true }
            },
        },
    },
    filetypes = { 'python' }
 }

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
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

if !has('nvim-0.5.0')
    finish
endif

lua <<EOF

    -- left here as an example
    -- vim.fn.sign_define("LspDiagnosticsSignError", {text="E", texthl="LspDiagnosticsError", linehl="", numhl="" })
    -- vim.fn.sign_define("LspDiagnosticsSignWarning", {text="W", texthl="LspDiagnosticsWarning", linehl="", numhl=""})
    -- vim.fn.sign_define("LspDiagnosticsSignInformation", {text="I", texthl="LspDiagnosticsInformation", linehl="", numhl=""})
    -- vim.fn.sign_define("LspDiagnosticsSignHint", {text="H", texthl="LspDiagnosticsHint", linehl="", numhl=""})

    -- this is required to redefine LSPDiagnostics* hightlight groups as most of colorshemes out there
    -- do `hi reset`
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

EOF

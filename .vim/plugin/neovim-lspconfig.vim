if !has('nvim-0.5.0')
    finish
endif

nnoremap <silent> <leader>d     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>k     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>D     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>s     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>t     <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>r     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> <leader>dd    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>dn    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>dp    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

" highlight! link LspDiagnosticsVirtualTextError LspDiagnosticsError
" highlight! link LspDiagnosticsVirtualTextWarning LspDiagnosticsWarning
" highlight! link LspDiagnosticsVirtualTextInformation LspDiagnosticsInformation
" highlight! link LspDiagnosticsVirtualTextHint LspDiagnosticsHint

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

" hi LspReferenceText cterm=bold gui=bold
" hi LspReferenceRead cterm=bold gui=bold
" hi LspReferenceWrite cterm=bold gui=bold

" augroup LSPDocHighlight
"     autocmd!
"     autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
"     autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
"     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
" augroup END

augroup MyLSP
    autocmd!
    autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

let g:completion_trigger_on_delete = 1

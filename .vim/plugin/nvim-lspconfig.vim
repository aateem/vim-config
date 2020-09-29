if !has('nvim-0.5.0')
    finish
endif

nnoremap <silent> <leader>d     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>k     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>D     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>s     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>t     <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>r     <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leaser>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>

lua <<EOF
    require'nvim_lsp'.pyls.setup{
        settings = {
            configurationSources = {
                pycodestyle,
                flake8
            },
            plugins = {
                flake8 = { enabled = true },
                pylint = { enabled = false },
            }
        }
    }
EOF

augroup MyLSP
    autocmd!
    autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc

    " autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
augroup END

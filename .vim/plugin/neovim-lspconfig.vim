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

    local on_attach = function(client)
        require'completion'.on_attach(client)
        require'diagnostic'.on_attach(client)
    end

    require'nvim_lsp'.pyls.setup{
        on_attach=on_attach,
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
augroup END

let g:diagnostic_enable_virtual_text = 1
nnoremap <silent> <leader>j :OpenDiagnostic<CR>

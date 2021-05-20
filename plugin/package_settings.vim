" lsp-client mappings
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

" left as an example
" highlight! link LspDiagnosticsVirtualTextError LspDiagnosticsError
" highlight! link LspDiagnosticsVirtualTextWarning LspDiagnosticsWarning
" highlight! link LspDiagnosticsVirtualTextInformation LspDiagnosticsInformation
" highlight! link LspDiagnosticsVirtualTextHint LspDiagnosticsHint

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

" telescope mappings
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <silent> gs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

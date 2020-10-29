if !has('nvim-0.5.0')
    finish
endif

nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }<CR>

nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

nnoremap <silent> gs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>

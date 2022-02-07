" idk how this plays with nvim-cmp
" augroup MyLSP
"     autocmd!
"     autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" augroup END

let g:completion_trigger_on_delete = 1

" telescope mappings
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <silent> gs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

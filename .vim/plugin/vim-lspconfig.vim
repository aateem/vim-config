if has('nvim-0.5.0')
    finish
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'flake8': {'enabled': v:true}, 'pylint': {'enabled': v:false}, 'pycodestyle': {'enabled': v:false}}}}
        \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
endif
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
noremap <silent> <leader>d :LspDefinition<CR>
noremap <silent> <leader>r :LspReferences<CR>
noremap <silent> <leader>f :LspDocumentFormat<CR>
noremap <silent> <leader>n :LspRename<CR>
noremap <silent> <leader>c :LspDocumentDiagnostics<CR>

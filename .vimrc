let $VIMDIR=fnamemodify($MYVIMRC, ':h') . '/.vim'

filetype off

if has('nvim-0.5.0')
    packadd! nvim-lspconfig
    packadd! deoplete.nvim
    packadd! deoplete-lsp
    packadd! diagnostic-nvim

    call deoplete#enable()
else
    packadd! async.vim
    packadd! vim-lsp
    packadd! asyncomplete-lsp.vim
    packadd! asyncomplete.vim
endif

packadd! base16-vim
packadd! nord-vim
packadd! vim-colors-solarized

packadd! vim-fugitive
packadd! vim-airline
packadd! ctrlp.vim
packadd! vim-surround
packadd! vim-gitgutter
packadd! vim-python-pep8-indent
packadd! nerdtree
packadd! ListToggle
packadd! vim-commentary
packadd! indentLine

syntax on
filetype plugin indent on

setlocal completeopt=menu,longest

let &t_SI.="\e[6 q" "SI = INSERT mode        / 6 -> solid vertical bar
let &t_SR.="\e[4 q" "SR = REPLACE mode       / 4 -> solid underscore
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE) / 1 -> blinking block

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" close quickfix window when file is closed
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
                \   q :cclose<cr>:lclose<cr>
    autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
                \   bd|
                \   q | endif

" ctrlp settings
set wildignore+=*.pyc,*.swp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ####################### Misc settings
autocmd BufWritePre * :%s/\s\+$//e  " trim trailing whitespaces on buffer's write

" toggle spelling checking
function ToggleSpell()
    if !exists("b:isChecked") || !b:isChecked
        setlocal spell spelllang=en_us
        let b:isChecked = 1
    else
        set nospell
        let b:isChecked = 0
    endif
endfunction
nmap <F5> :call ToggleSpell()<CR>

"simplified windows navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"python file settings
au BufNewFile,BufRead python
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ set cc=80

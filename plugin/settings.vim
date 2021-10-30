if has('termguicolors')
    set termguicolors
endif

if has('gui_running')
    set guioptions-=m  " remove menubar from gui interface
    set guioptions-=T  " remove toolbar from gui interface
    set guioptions-=r  " remove right hand scroll bar from gui interface
endif

" colorscheme base16-default-light
colorscheme onedark

" set list
set listchars=nbsp:⦸    " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:»·
set listchars+=trail:·

" switch to (absolute) number when losing focus,
" useful when working with the same file in the split
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

" setlocal completeopt=menu,longest
" setlocal completeopt=menuone,noinsert,longest
set completeopt=menuone,noinsert,noselect

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
    \ set fileformat=unix
    \ set cc=80

" make resize more convenient
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" quick write
nnoremap <Leader>w :w<CR>

" quick tab navigation
nnoremap <Leader>t gt
nnoremap <Leader>T gT

" quick switch between recent buffers
nnoremap <Leader>b <C-^>

" enable mouse support
set mouse=a

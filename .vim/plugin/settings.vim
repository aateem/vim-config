scriptencoding utf-8

" use this with 8.0 version
if has('termguicolors')
    set termguicolors
endif

if has('gui_running')
    set guioptions-=m  " remove menubar from gui interface
    set guioptions-=T  " remove toolbar from gui interface
    set guioptions-=r  " remove right hand scroll bar from gui interface
endif

if has('mac')
    set guifont=Monaco:h13
else
    set guifont=Ubuntu\ Mono\ 13
endif

set background=dark
colorscheme base16-default-light

set synmaxcol=256      " limit number of chars in line that are colorized

set mousehide           " hide mouse cursor while typing

set laststatus=2        " always display status line

set list
set listchars=nbsp:⦸    " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:»·
set listchars+=trail:·

set number          " enable line numbering
set relativenumber

" switch to (absolute) number when losing focus,
" useful when working with the same file in the split
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

set expandtab       " replace tabs with spaces
set tabstop=4       " number of spaces to replace tab
set shiftwidth=4    " number of spaces inserted for indentation
set smarttab        " align tab instead of just inserting 4 spaces

set incsearch       " enable incremental search
set ignorecase      " ignore search case
set smartcase       " match upper case when it is specified
set hlsearch        " highlight search results

set virtualedit=all " you can move your cursor through every position in text
set backspace=2     " allow spacing over indent, eol and the start of insert

set showmode        " show what mode you are in

set cursorline      " highlight line cursor pos
set cursorcolumn    " highlight column cursor pos

set splitbelow      " put new window below when horizontal splitting
set splitright      " put new window right when vertical splitting


if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backup                          " write backup
  let b:backup_path = $HOME . "/.vim/tmp/backup"
  if !isdirectory(b:backup_path)
      call mkdir(b:backup_path)
  endif
  let &backupdir = b:backup_path      " set backup directory
endif

if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=$HOME/.vim/tmp/swap/      " keep swap files out of the way
endif

set scrolloff=3                       " start scrolling 3 lines before edge of viewport

set hidden          " hide buffers with unsaved changes

set autoread        " update files which has been modified outside of vim
" set autochdir       " change current working directory for vim

set wildmenu        " enchanced commandline completion

set undolevels=2048

set nocompatible    " be vImproved :)

set belloff=all     " disable bells

set encoding=utf-8

if has('nvim')
    let g:python3_host_prog = fnamemodify($MYVIMRC, ":h") . "/venv" . "/bin/python"
endif

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

let $VIMDIR=fnamemodify($MYVIMRC, ':h') . '/.vim'
" ################# Bundles/plugins

filetype off

if !isdirectory($VIMDIR . '/bundle')
    call mkdir($VIMDIR . '/bundle', 'p')
    cd $VIMDIR/bundle
    if executable('git')
        !git clone https://github.com/gmarik/Vundle.vim.git
    else
        echo 'WARNING: Git is missing! Cannot pull Vundle plugin.'
    endif
endif

set rtp+=$VIMDIR/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'python/black'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'

Plugin 'chriskempson/base16-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/ListToggle'
call vundle#end()

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'priority': 1,
        \ 'workspace_config': {
          \ 'pyls': {
               \ 'plugins': {
                    \ 'flake8': {'enabled': v:true},
                    \ 'pycodestyle': {'enabled': v:false},
               \ }
          \ },
        \ },
        \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
endif

let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode


setlocal completeopt=menu,longest

noremap <silent> <leader>d :LspDefinition<CR>
noremap <silent> <leader>r :LspReferences<CR>
noremap <silent> <leader>c :LspDocumentDiagnostics<CR>

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

" ################## Bundle setting
let g:black_linelength = 100

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" tagbar mapping
nmap <F6> :TagbarToggle<CR>

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

" ################# General and test formatting settings
syntax on
filetype plugin indent on

set nocompatible    " be vImproved :)

set vb              " set visual bell

set undolevels=2048

set splitbelow      " put new window below when horizontal splitting
set splitright      " put new window right when vertical splitting

set backup          " backups of files

" set backup and swap storing dirs to one well reachable and manageable
" location
if !isdirectory($VIMDIR . '/swap')
    call mkdir($VIMDIR . '/swap', 'p')
endif
if !isdirectory($VIMDIR . '/backup')
    call mkdir($VIMDIR . '/backup', 'p')
endif

set directory=$VIMDIR/swap
set backupdir=$VIMDIR/backup

set smarttab        " align tab instead of just inserting 4 spaces

set incsearch       " enable incremental search
set ignorecase      " ignore search case
set smartcase       " match upper case when it is specified
set hlsearch        " highlight search results

set number          " enable line numbering
set cursorline      " highlight line cursor pos
set cursorcolumn    " highlight column cursor pos
set virtualedit=all " you can move your cursor through every position in text

set backspace=2     " allow spacing over indent, eol and the start of insert

set autoread        " update files which has been modified outside of vim
set autochdir       " change current working directory for vim

set wildmenu        " enchanced commandline completion

set showmode        " show what mode you are in

set expandtab       " replace tabs with spaces
set tabstop=4       " number of spaces to replace tab
set shiftwidth=4    " number of spaces inserted for intendation

set encoding=utf-8

" ######################## Appearance
set t_Co=256            " set 256 color mode

set synmaxcol=256      " limit number of chars in line that are colorized

set mousehide           " hide mouse cursor while typing

set laststatus=2        " always display status line

set list
set listchars=tab:»·,trail:·

set background=dark
colorscheme nord

if has('gui_running')
    colorscheme nord

    set guioptions-=m  " remove menubar from gui interface
    set guioptions-=T  " remove toolbar from gui interface
    set guioptions-=r  " remove right hand scroll bar from gui interface

    if has('mac')
        set guifont=Monaco:h13
    else
        set guifont=Ubuntu\ Mono\ 13
    endif
endif

" use this with 8.0 version
if has('termguicolors')
    set termguicolors
    colorscheme nord
endif

" ####################### Misc settings
autocmd BufWritePre * :%s/\s\+$//e  " trim trailing whitespaces on buffer's write
autocmd BufWritePre *.py execute ':Black'

"let python_highlight_all=1

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

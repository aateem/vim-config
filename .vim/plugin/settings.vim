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
colorscheme nord

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
set autochdir       " change current working directory for vim

set wildmenu        " enchanced commandline completion

set undolevels=2048

set nocompatible    " be vImproved :)

set belloff=all     " disable bells

set encoding=utf-8

let $VIMDIR=fnamemodify($MYVIMRC, ':h') . '/.vim'

filetype off

packadd! nvim-lspconfig
packadd! completion-nvim

packadd! popup.nvim
packadd! plenary.nvim
packadd! telescope.nvim

packadd! base16-vim
packadd! nord-vim
packadd! vim-colors-solarized

packadd! vim-fugitive
packadd! vim-airline
packadd! vim-surround
packadd! vim-gitgutter
packadd! vim-python-pep8-indent
packadd! nerdtree
packadd! ListToggle
packadd! vim-commentary
packadd! indentLine

syntax on
filetype plugin indent on

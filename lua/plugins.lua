local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = string.format(
    '%s/site/pack/packer/start/',
    fn.stdpath('data')
)

if fn.empty(fn.glob(install_path)) > 0 then
    print("Packer is not present. Installing ...")
    fn.mkdir(install_path, 'p')

    local out = fn.system({
        'git', 'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path .. '/packer.nvim',
    })
    print(out)
    execute 'packadd packer.nvim'
end

return require('packer').startup(
    function(use)
        -- let packer manage itself
        use 'wbthomason/packer.nvim'

        -- fancy colors
        use 'joshdick/onedark.vim'
        use 'arcticicestudio/nord-vim'
        use 'chriskempson/base16-vim'

        -- navigation
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}
            }
        }

        -- lsp stuff
        use "neovim/nvim-lspconfig"
        use "nvim-lua/completion-nvim"

        -- git
        use "tpope/vim-fugitive"
        use "airblade/vim-gitgutter"

        -- text manipulation
        use "tpope/vim-surround"
        use "tpope/vim-commentary"
        use "Yggdroot/indentLine"
        -- -- python
        use "Vimjas/vim-python-pep8-indent"

        -- UI enchancements
        use "vim-airline/vim-airline"

        -- sugar over vim functionality
        use "Valloric/ListToggle"

        -- browsers
        use "preservim/nerdtree"
    end
)


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

        use 'onsails/lspkind-nvim'

        -- fancy colors
        use 'joshdick/onedark.vim'
        use 'arcticicestudio/nord-vim'
        use 'chriskempson/base16-vim'
        use 'EdenEast/nightfox.nvim'

        -- navigation
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}
            }
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"

        -- lsp stuff
        use "neovim/nvim-lspconfig"

        -- completion stuff
        use "hrsh7th/nvim-cmp"
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

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


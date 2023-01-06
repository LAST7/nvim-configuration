return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- gruvbox theme
        use 'glepnir/zephyr-nvim'

        -- Lspconfig
        use {
                'neovim/nvim-lspconfig',
                'williamboman/nvim-lsp-installer',
        }

        -- completion
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        -- snippets
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'
        -- lspkind
        use 'onsails/lspkind-nvim'

        -- treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        -- colorizer
        use 'norcalli/nvim-colorizer.lua'
        require 'colorizer'.setup {
            'css';
            'javascript';
            html = {
                    mode = 'foreground';
            }
        }
        -- I dont know why this doesnt work in a seperate file

        -- lualine
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

        -- autopair
        use {
            'windwp/nvim-autopairs',
            config = function() require("nvim-autopairs").setup {} end
        }

end)

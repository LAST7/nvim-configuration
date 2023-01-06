" Basic settings
lua require('basic')

set clipboard+=unnamedplus

" Keyboard mappings
lua require('keybindings')


" Packer plugin management
lua require('plugins')

" lsp
lua require('lsp.setup')

" completion
lua require('lsp.cmp')

" treesitter
lua require('treesitter')

" lualine
lua require('lua-line')

" colorizer
lua require('colorize')

" auto-pair
lua require('auto-pair')
" lua require('nvim-autopairs').disable()

" theme
set background=dark
colorscheme zephyr


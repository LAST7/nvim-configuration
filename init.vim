
" Basic settings
lua require('basic')

set clipboard+=unnamedplus

" Keyboard mappings
lua require('keybindings')


" Packer plugin management
lua require('plugins')

" lsp
lua require('lsp/setup')

" completion
lua require('lsp/cmp')

" theme
set background=dark
colorscheme zephyr

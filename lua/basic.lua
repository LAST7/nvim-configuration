-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- remain lines around the cursor
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight the current line
vim.wo.cursorline = true

-- icon instruction on the left side
vim.wo.signcolumn = "yes"

-- the reference line on the right side
vim.wo.colorcolumn = "90"

-- set tabstop to 2
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- replace tab with space
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true

-- ignore case when searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- apply search when typing
vim.o.incsearch = true

-- when the file is edited by external program, auto load
vim.o.autoread = true
vim.bo.autoread = true

-- mouse support
vim.o.mouse = "a"

-- no backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- wait for mappings
vim.o.timeoutlen = 300

-- split window below or right
vim.o.splitbelow = true
vim.o.splitright = true

-- do not select things in auto-completion
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- appearance
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- show invisible characters (space)
vim.o.list = true
vim.o.listchars = "space:·"

-- enhance the completion function
vim.o.wildmenu = true





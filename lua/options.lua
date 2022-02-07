vim.g.mapleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.list = true
vim.opt.listchars = {
    -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    -- this breaks the script; the UTF code point is
    -- nbsp = "⦸ " ,
    tab = "»·",
    trail = "·"
}

vim.o.hidden = true
vim.o.scrolloff = 3
vim.o.synmaxcol = 256      -- limit number of chars in line that are colorized
vim.o.list = true
vim.o.ignorecase = true      -- ignore search case
vim.o.smartcase = true       -- match upper case when it is specified
vim.o.virtualedit = "all"    -- you can move your cursor through every position in text
vim.o.showmode = true        -- show what mode you are in
vim.o.cursorline = true      -- highlight line cursor pos
vim.o.cursorcolumn = true    -- highlight column cursor pos
vim.o.splitbelow = true      -- put new window below when horizontal splitting
vim.o.splitright = true      -- put new window right when vertical splitting
vim.o.expandtab = true       -- replace tabs with spaces
vim.o.tabstop = 4            -- number of spaces to replace tab
vim.o.softtabstop=4
vim.o.shiftwidth = 4         -- number of spaces inserted for indentation
vim.o.wildmenu = true
vim.o.undolevels = 2048
vim.o.background = "dark"
vim.o.mouse = "a"           -- enable mouse support

vim.g.mapleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.hidden = true
vim.o.scrolloff = 3
vim.o.synmaxcol = 256      -- limit number of chars in line that are colorized
vim.o.list = true
vim.o.ignorecase = true      -- ignore search case
vim.o.smartcase = true       -- match upper case when it is specified
vim.o.virtualedit = "all" -- you can move your cursor through every position in text
vim.o.showmode = true        -- show what mode you are in
vim.o.cursorline = true      -- highlight line cursor pos
vim.o.cursorcolumn = true    -- highlight column cursor pos
vim.o.splitbelow = true      -- put new window below when horizontal splitting
vim.o.splitright = true      -- put new window right when vertical splitting
vim.o.expandtab = true       -- replace tabs with spaces
vim.o.tabstop = 4       -- number of spaces to replace tab
vim.o.shiftwidth = 4    -- number of spaces inserted for indentation
vim.o.wildmenu = true
vim.o.undolevels = 2048
vim.o.background = "dark"
vim.o.mouse = "a" -- enable mouse support

-- in combination with:
-- number == true && relativenumber == true
-- this autocmd also enables the behavior where
-- buffer with lost focus is switched to the
-- absolute line numbers;
-- I find this presentation very useful as
-- it easier to track my position in those
-- buffers
vim.api.nvim_exec([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
]] ,true)

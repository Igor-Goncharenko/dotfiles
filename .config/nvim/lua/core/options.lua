-----------------------------
-- General neovim settings --
-----------------------------

-- Numeration & Lines
vim.opt.number = true           -- enable line numbers
vim.opt.relativenumber = true   -- relative line numbers

vim.opt.scrolloff = 4           -- minimum number of lines to keep above and below the cursor
vim.opt.cursorline = true       -- highlight current line

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true        -- convert tab to spaces
--vim.opt.list = true             -- show tab characters and trailing whitespace
vim.opt.autoindent = true       -- auto indentation

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set directory where undo files are stored
vim.opt.undofile = true         -- save undo history to a file

-- Other 
vim.opt.encoding = "utf-8"

vim.opt.termguicolors = true    -- enable true color support


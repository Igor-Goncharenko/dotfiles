-- space bar leader key
vim.g.mapleader = " "

-- fast save
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- reload neovim
vim.keymap.set("n", "<leader>r", ":so %<CR>")

-- unhighlight
vim.keymap.set("n", "<leader>nh", ":noh<CR>")

-- buffers
vim.keymap.set("n", "gn", ":bn<cr>")
vim.keymap.set("n", "gp", ":bp<cr>")
vim.keymap.set("n", "gx", ":bd<cr>")

-- add emtpy line without leaving normal mode (up & down)
vim.keymap.set("n", "co", "o<Esc>")
vim.keymap.set("n", "cO", "O<Esc>")

-- moving in insert mode by Alt + hjkl
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("i", "<A-j>", "<Down>")
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-l>", "<Right>")

-- fast copy and paste to clipboard
vim.keymap.set("v", "<C-Y>", '"*y')
vim.keymap.set("n", "<C-P>", '"*p')



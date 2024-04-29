-- create map function
crmap = function(mode, key, cmd, desc) 
  vim.keymap.set(mode, key, cmd, { desc = desc })
end

-- space bar leader key
vim.g.mapleader = " "

-- fast save
crmap("n", "<leader>s", ":w<CR>", "Save file")

-- reload neovim
crmap("n", "<leader>rr", ":so %<CR>", "Reload neovim")

-- unhighlight
crmap("n", "<leader>nh", ":noh<CR>", "Off highlighting")

-- buffers
crmap("n", "gn", ":bn<cr>", "Next buffer")
crmap("n", "gp", ":bp<cr>", "Previous buffer")
crmap("n", "gx", ":bd<cr>", "Close buffer")

-- add emtpy line without leaving normal mode (up & down)
crmap("n", "co", "o<Esc>", "Add empty line below [N]")
crmap("n", "cO", "O<Esc>", "Add empty line above [N]")

-- moving in insert mode by Alt + hjkl
crmap("i", "<A-h>", "<Left>", "<Left>")
crmap("i", "<A-j>", "<Down>", "<Down>")
crmap("i", "<A-k>", "<Up>", "<Up>")
crmap("i", "<A-l>", "<Right>", "<Right>")

-- fast copy and paste to clipboard
crmap("v", "<C-Y>", '"+y', "Copy to '+'")
crmap("n", "<C-P>", '"+p', "Paste from '+'")



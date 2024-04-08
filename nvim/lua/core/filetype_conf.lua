----------------------------------------
-- Formatting for different filetypes --
----------------------------------------

-- python formatting
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.py",
  callback = function()
    vim.opt.textwidth = 88
    vim.opt.colorcolumn = "88"
  end
})

-- c/c++ formatting
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.c", "*.cpp" },
  callback = function()
    vim.opt.textwidth = 100
    vim.opt.colorcolumn = "100"
  end
})

-- javascript formatting
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.js", "*.html", "*.css", "*.lua"},
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.textwidth = 100
    vim.opt.colorcolumn = "100"
  end
})

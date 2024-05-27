----------------------------------------
-- Formatting for different filetypes --
----------------------------------------

-- python formatting
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   pattern = "*.py",
--   callback = function()
--     vim.opt.textwidth = 80
--     vim.opt.colorcolumn = "80"
--   end
-- })

-- c/c++ formatting
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   pattern = { "*.c", "*.cpp" },
--   callback = function()
--     vim.opt.textwidth = 80
--     vim.opt.colorcolumn = "80"
--   end
-- })

-- rust formatting
-- vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
--   pattern = { "*.rs" },
--   callback = function()
--     vim.opt.textwidth = 80
--     vim.opt.colorcolumn = "80"
--   end
-- })

-- javascript formatting
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.js", "*.html", "*.css", "*.lua", "*.json"},
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

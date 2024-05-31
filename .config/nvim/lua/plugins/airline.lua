return {
  "vim-airline/vim-airline",
  dependencies = { "vim-airline/vim-airline-themes" },
  config = function ()
    -- local airline = require("airline")
    vim.g.airline_theme = "gruvbox"
  end,
}


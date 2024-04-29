return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "soft"
    vim.g.gruvbox_termcolors = 16 -- 16

    -- load the colorscheme here
    vim.cmd([[colorscheme gruvbox]])
  end
}

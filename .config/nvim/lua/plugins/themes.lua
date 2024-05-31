return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "soft"
    vim.g.gruvbox_termcolors = 256 -- 16

    -- load the colorscheme here
    vim.cmd([[colorscheme gruvbox]])

    -- customize colors

    -- https://neovim.io/doc/user/lsp.html#lsp-quickstart
    --[[
    @lsp.type.class
    @lsp.type.comment
    @lsp.type.decorator
    @lsp.type.enum
    @lsp.type.enumMember
    @lsp.type.event
    @lsp.type.function
    @lsp.type.interface
    @lsp.type.keyword
    @lsp.type.macro
    @lsp.type.method
    @lsp.type.modifier
    @lsp.type.namespace
    @lsp.type.number
    @lsp.type.operator
    @lsp.type.parameter
    @lsp.type.property
    @lsp.type.regexp
    @lsp.type.string
    @lsp.type.struct
    @lsp.type.type
    @lsp.type.typeParameter
    @lsp.type.variable
    @lsp.mod.async
    @lsp.mod.declaration
    @lsp.mod.defaultLibrary
    @lsp.mod.definition
    @lsp.mod.deprecated
    @lsp.mod.documentation
    @lsp.mod.modification
    @lsp.mod.readonly
    @lsp.mod.static
    ]]--

    if vim.o.background == "dark" then 
      vim.api.nvim_set_hl(0, "NormalFloat", {bg="#282828"})
    end

    -- gruvbox dark hard
    if vim.o.background == "dark" and vim.g.gruvbox_contrast_dark == "hard" then
      vim.api.nvim_set_hl(0, "@lsp.type.variable", {fg="#83a598"})
      vim.api.nvim_set_hl(0, "@lsp.type.parameter", {fg="#83a598"})
      -- vim.api.nvim_set_hl(0, "@lsp.type.macro", {fg="#8ec07c"})
    end

  end
}

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-path",             -- source for file system paths
    --"hrsh7th/vim-vsnip",
    --"hrsh7th/vim-vsnip-integ",
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      version = "v2.*", 
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",         -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      -- configure how nvim-cmp interacts with snippet engine
      snippet = {
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body)        -- for `vsnip` users
        require("luasnip").lsp_expand(args.body)  -- for 'luasnip' users
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
          '<Plug>luasnip-expand-or-jump', true, true, true), '')
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
          '<Plug>luasnip-jump-prev', true, true, true), '')
        else
          fallback()
        end
      end,
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
      { name = "luaship" },
      { name = "nvim_lsp" },  -- lsp
      { name = "luasnip" },   -- snippets
      { name = "buffer" },    -- text within current buffer
      { name = "path" },      -- file system paths
    }),
    -- configure lspkind for vs-code like icons
    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
      format = require("lspkind").cmp_format({
        maxwidth = 40,
        ellipsis_char = "...",
      }),
    },
  })
end,
}

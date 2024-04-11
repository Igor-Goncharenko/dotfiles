return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-path",             -- source for file system paths
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

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      -- configure how nvim-cmp interacts with snippet engine
      snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)  -- for 'luasnip' users
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      --["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      --["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),     -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(),            -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      -- next suggestion
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      -- previous suggestion
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
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
      format = lspkind.cmp_format({
        maxwidth = 40,
        ellipsis_char = "...",
      }),
    },
  })
end,
}

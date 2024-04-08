return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { 
      "antosha417/nvim-lsp-file-operations", 
      dependencies = { "nvim-lua/plenary.nvim" },
      config = true 
    },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local on_attach = function(client, bufnr)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions

      -- Create map function.
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        local opts = { noremap = true, silent = true, buffer = bufnr, desc = desc }
        vim.keymap.set("n", keys, func, opts)
      end

      -- TODO: rewrite all keymaps using 'nmap' function
      -- set keybinds
      local opts = { noremap = true, silent = true, buffer = bufnr }
      -- show definition, references
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      -- go to declaration
      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      -- show lsp definitions
      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      -- show lsp implementations
      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      -- show lsp type definitions
      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      -- see available code actions, in visual mode will apply to selection
      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      -- smart rename
      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      -- show  diagnostics for file
      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      -- show diagnostics for line
      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      -- jump to previous diagnostic in buffer
      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      -- jump to next diagnostic in buffer
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      -- show documentation for what is under cursor
      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- mapping to restart lsp if necessary
      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = "a ", Warn = "b ", Hint = "c", Info = "d" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- python config
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "python" },
    })

    -- c/c++ config
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "c", "cpp", "objc", "objcpp" },
    })
  end,
}


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

      -- set keybinds

      -- show definition, references
      nmap("gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")

      -- go to declaration
      nmap("gD", vim.lsp.buf.declaration, "Go to declaration")

      -- show lsp definitions
      nmap("gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")

      -- show lsp implementations
      nmap("gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")

      -- show lsp type definitions
      nmap("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

      -- see available code actions, in visual mode will apply to selection
      nmap("<leader>ca", vim.lsp.buf.code_action, "See available code actions")

      -- smart rename
      nmap("<leader>rn", vim.lsp.buf.rename, "Smart rename")

      -- show  diagnostics for file
      nmap("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", 
      "Show buffer diagnostics")

      -- show diagnostics for line
      nmap("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")

      -- jump to previous diagnostic in buffer
      nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")

      -- jump to next diagnostic in buffer
      nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic")

      -- show documentation for what is under cursor
      nmap("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")

      -- mapping to restart lsp if necessary
      nmap("<leader>rs", ":LspRestart<CR>", "Restart LSP")
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- If it's not working, install 'Nerd Font'
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
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


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

    local on_attach = function(_, bufnr)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions

      -- Create map function.
      local nmap = function(keys, func, desc)
        -- if desc then
        --   desc = "LSP: " .. desc
        -- end
        local opts = { noremap = true, silent = true, buffer = bufnr, desc = desc }
        vim.keymap.set("n", keys, func, opts)
      end

      -- set keybinds


      nmap("<leader>gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")

      -- go to declaration
      nmap("<leader>gD", vim.lsp.buf.declaration, "Go to declaration")

      -- show lsp definitions
      nmap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")

      -- show lsp implementations
      nmap("<leader>gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")

      -- show lsp type definitions
      nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

      -- see available code actions, in visual mode will apply to selection
      nmap("<leader>gca", vim.lsp.buf.code_action, "See available code actions")

      -- smart rename
      nmap("<leader>gr", vim.lsp.buf.rename, "Smart rename")

      -- show documentation for what is under cursor
      nmap("<leader>gk", vim.lsp.buf.hover, "Show documentation for what is under cursor")

      -- mapping to restart lsp if necessary
      nmap("<leader>rs", ":LspRestart<CR>", "Restart LSP")

      -- diagnostics block
      nmap("<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>",
          "Open float diagnostic window")
      nmap("<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>",
          "Goto previous diagnostic message")
      nmap("<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>",
          "Goto previous diagnostic message")
      nmap("<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>",
          "Open diagnostic local list")
      nmap("<leader>dt", "<cmd>Telescope diagnostics<CR>",
           "Open telescope diagnostic")
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

    -- rust config
    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true
          },
        }
      }
    })

    -- lua config
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "lua" },
    })
  end,
}


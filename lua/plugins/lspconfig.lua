return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "marksman",          -- Markdown / Quarto
          "pyright",           -- Python
          "r_language_server", -- R
          "julials",           -- Julia
          "clangd",            -- C / C++
        },
      }

      local lspconfig = require("lspconfig")

      -- Minimal capabilities (no cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Add semantic tokens support
      capabilities.textDocument.semanticTokens = {
        dynamicRegistration = false,
        requests = {
          range = true,
          full = true,
        },
        tokenTypes = {},
        tokenModifiers = {},
        formats = { "relative" },
        overlappingTokenSupport = true,
        multilineTokenSupport = true,
      }

      -- Servers
      lspconfig.marksman.setup { capabilities = capabilities }
      lspconfig.pyright.setup { capabilities = capabilities }
      lspconfig.r_language_server.setup { capabilities = capabilities }
      lspconfig.julials.setup { capabilities = capabilities }
      lspconfig.clangd.setup {
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy" }, -- optional extras
      }
    end,
  },
}

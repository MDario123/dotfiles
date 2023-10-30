local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    completeUnimported = true,
    usePlaceholder = true,
    analyses = {
      unusedparams = true,
      fieldalignment = true,
      nilness = true,
    },
  },
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}

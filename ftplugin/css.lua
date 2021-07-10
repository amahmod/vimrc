if not require("utils").check_lsp_client_active "cssls" then

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- :LspInstall css
  require("lspconfig").cssls.setup {
    cmd = {
      "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
      "--stdio"
    },
    on_attach = function(client)
      client.resolved_capabilities.document_formating = false
      require("lsp").common_on_attach(client)
    end
  }
end

vim.cmd "setl ts=2 sw=2"

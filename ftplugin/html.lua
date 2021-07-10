if not require("utils").check_lsp_client_active "html" then
  -- npm install -g vscode-html-languageserver-bin
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("lspconfig").html.setup {
    cmd = {
      "node", DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
      "--stdio"
    },
    on_attach = function(client)
      client.resolved_capabilities.document_formating = false
      require("lsp").common_on_attach(client)
    end,
    capabilities = capabilities,
    settings = {documentFormatting = false}
  }
end

vim.cmd "setl ts=2 sw=2"

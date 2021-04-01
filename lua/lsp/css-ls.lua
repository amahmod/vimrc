-- npm install -g vscode-css-languageserver-bin
local utils = require('lsp.utils')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  on_attach = function(client)
    --  format using prettier
    client.resolved_capabilities.document_formating = false
    utils.custom_on_attach(client)
  end,
  on_init = utils.custom_on_init,
  capabilities = capabilities
}

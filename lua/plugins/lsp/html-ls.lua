-- npm install -g vscode-html-languageserver-bin
local events = require('plugins.lsp.events')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  on_attach = events.custom_on_attach,
  on_init = events.custom_on_init,
  capabilities = capabilities
}

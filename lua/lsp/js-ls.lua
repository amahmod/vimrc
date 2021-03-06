local utils = require('lsp.utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.tsserver.setup {
  on_attach = function(client)
    --  format using prettier
    client.resolved_capabilities.document_formatting = false
    utils.custom_on_attach(client)
  end,
  on_init = utils.custom_on_init,
  settings = {documentFormatting = false},
  capabilities = capabilities
}

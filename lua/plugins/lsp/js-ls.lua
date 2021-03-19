local events = require('plugins.lsp.events')
require'lspconfig'.tsserver.setup {
  on_attach = function(client)
    --  format using prettier
    client.resolved_capabilities.document_formating = false
    events.custom_on_attach(client)
  end,
  on_init = events.custom_on_init,
  settings = {documentFormatting = false}
}

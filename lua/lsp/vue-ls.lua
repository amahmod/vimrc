-- npm install -g vls
local utils = require('lsp.utils')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.vuels.setup {
  on_attach = function(client)
    --  format using prettier
    client.resolved_capabilities.document_formating = false
    utils.custom_on_attach(client)
  end,
  on_init = utils.custom_on_init,
  settings = {
    init_options = {
      vetur = {
        format = {styleInitialIndent = true, scriptInitialIndent = true},
        experimental = {templateInterpolationService = true}
      }
    }
  },
  capabilities = capabilities
}

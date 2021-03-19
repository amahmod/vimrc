-- npm install -g vls
local events = require('plugins.lsp.events')
require'lspconfig'.vuels.setup {
  on_attach = events.custom_on_attach,
  on_init = events.custom_on_init,
  settings = {
    init_options = {
      vetur = {
        format = {styleInitialIndent = true, scriptInitialIndent = true},
        experimental = {templateInterpolationService = true}
      }
    }
  }
}

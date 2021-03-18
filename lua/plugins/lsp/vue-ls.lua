-- npm install -g vls
require'lspconfig'.vuels.setup {
  on_attach = require'plugins.lsp.functions'.common_on_attach,
  settings = {
    init_options = {
      vetur = {
        format = {
          styleInitialIndent = true,
          scriptInitialIndent = true
        },
        experimental = {
          templateInterpolationService = true
        }
      }
    }
  }
}

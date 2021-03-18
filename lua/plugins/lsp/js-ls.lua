require'lspconfig'.tsserver.setup {
  on_attach = require('plugins.lsp.functions').common_on_attach
}

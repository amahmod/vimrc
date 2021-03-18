-- npm install -g yaml-language-server
require'lspconfig'.yamlls.setup{
    on_attach = require'plugins.lsp.functions'.common_on_attach,
}

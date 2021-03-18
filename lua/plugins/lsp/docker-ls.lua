-- npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup {on_attach = require'plugins.lsp.functions'.common_on_attach}

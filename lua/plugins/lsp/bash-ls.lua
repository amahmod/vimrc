-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {on_attach = require'plugins.lsp.functions'.common_on_attach}

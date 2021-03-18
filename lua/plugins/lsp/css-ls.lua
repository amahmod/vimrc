-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {on_attach = require'plugins.lsp.functions'.common_on_attach}

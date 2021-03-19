-- npm install -g vscode-css-languageserver-bin
local events = require('plugins.lsp.events')

require'lspconfig'.cssls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

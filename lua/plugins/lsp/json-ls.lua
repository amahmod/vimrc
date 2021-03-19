-- npm install -g vscode-json-languageserver
local events = require('plugins.lsp.events')
require'lspconfig'.jsonls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

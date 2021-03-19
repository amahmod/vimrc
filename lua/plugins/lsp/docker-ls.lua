-- npm install -g dockerfile-language-server-nodejs
local events = require('plugins.lsp.events')
require'lspconfig'.dockerls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

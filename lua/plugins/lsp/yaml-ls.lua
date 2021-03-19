-- npm install -g yaml-language-server
local events = require('plugins.lsp.events')
require'lspconfig'.yamlls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

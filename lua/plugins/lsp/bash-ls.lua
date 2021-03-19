-- npm i -g bash-language-server
local events = require('plugins.lsp.events')

require'lspconfig'.bashls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

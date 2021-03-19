-- npm install -g vim-language-server
local events = require('plugins.lsp.events')
require'lspconfig'.vimls.setup {on_attach = events.custom_on_attach, on_init = events.custom_on_init}

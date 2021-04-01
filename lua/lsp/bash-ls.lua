-- npm i -g bash-language-server
local Utils = require('lsp.utils')

require'lspconfig'.bashls.setup {on_attach = Utils.custom_on_attach, on_init = Utils.custom_on_init}

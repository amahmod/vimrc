-- npm install -g dockerfile-language-server-nodejs
local utils = require('lsp.utils')
require'lspconfig'.dockerls.setup {on_attach = utils.custom_on_attach, on_init = utils.custom_on_init}

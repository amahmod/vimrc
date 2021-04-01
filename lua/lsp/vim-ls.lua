-- npm install -g vim-language-server
local utils = require('lsp.utils')
require'lspconfig'.vimls.setup {on_attach = utils.custom_on_attach, on_init = utils.custom_on_init}

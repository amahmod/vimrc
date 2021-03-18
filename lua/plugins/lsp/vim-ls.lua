-- npm install -g vim-language-server
require'lspconfig'.vimls.setup {on_attach = require'plugins.lsp.functions'.common_on_attach}

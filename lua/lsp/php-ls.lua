-- npm install -g intelephense
local Utils = require('lsp.utils')
require'lspconfig'.intelephense.setup {
  on_attach = Utils.custom_on_attach,
  on_init = Utils.custom_on_init,
  cmd = {"intelephense", "--stdio"},
  filetypes = {"php"},
  root_dir = require("lspconfig").util.root_pattern(unpack({".git/", "composer.json"}))
}

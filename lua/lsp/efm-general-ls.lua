-- Formatting via efm
local utils = require('lsp.utils')

local prettier = require "efm.prettier"
local eslint = require "efm.eslint"
local luafmt = require "efm.luafmt"

local languages = {
  lua = {luafmt},
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  vue = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier}
}

require'lspconfig'.efm.setup {
  init_options = {documentFormatting = true, codeAction = false},
  on_attach = utils.custom_on_attach,
  on_init = utils.custom_on_init,
  cmd = {"efm-langserver", '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  root_dir = require("lspconfig").util.root_pattern(unpack({".git/", "package.json"})),
  settings = {rootMarkers = {".git/"}, languages = languages},
  filetypes = vim.tbl_keys(languages),
  logfile = '~/.efm.log',
  loglevel = 1
}


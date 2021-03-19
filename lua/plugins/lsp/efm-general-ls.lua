-- Formatting via efm
local events = require('plugins.lsp.events')
local prettier = require "plugins.efm.prettier"
local eslint = require "plugins.efm.eslint"
local luafmt = require "plugins.efm.luafmt"

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
  on_attach = events.custom_on_attach,
  on_init = events.custom_on_init,
  cmd = {"efm-langserver", '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  root_dir = require("lspconfig").util.root_pattern(unpack({".git/", "package.json"})),
  settings = {rootMarkers = {".git/"}, languages = languages},
  filetypes = vim.tbl_keys(languages),
  logfile = '~/.efm.log',
  loglevel = 1
}


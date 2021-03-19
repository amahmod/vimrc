-- Formatting via efm
local prettier = require "plugins.efm.prettier"
local eslint = require "plugins.efm.eslint"
local luafmt = require "plugins.efm.luafmt"

local languages = {
    lua = {luafmt},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    javascriptreact = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    html = {prettier},
    scss = {prettier},
    css = {prettier},
    markdown = {prettier}
}

require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    on_attach = require("plugins.lsp.functions").common_on_attach,
    cmd = {"efm-langserver"},
    root_dir = require("lspconfig").util.root_pattern(unpack({".git/"})),
    settings = {rootMarkers = {".git/"}, languages = languages},
    filetypes = vim.tbl_keys(languages),
    logfile = '~/.efm.log',
    loglevel = 1
}


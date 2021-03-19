-- TODO figure out why this don't work
vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})

require('plugins.lsp.lspkind')
require('plugins.lsp.lightbulb')

require('plugins.lsp.html-ls')
require('plugins.lsp.css-ls')
require('plugins.lsp.js-ls')
require('plugins.lsp.json-ls')
require('plugins.lsp.bash-ls')
require('plugins.lsp.docker-ls')
require('plugins.lsp.lua-ls')
require('plugins.lsp.vim-ls')
require('plugins.lsp.yaml-ls')
require('plugins.lsp.vue-ls')
require('plugins.lsp.efm-general-ls')

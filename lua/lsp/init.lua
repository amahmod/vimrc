vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define('LightBulbSign', { text = "", texthl = "", linehl="", numhl="" })

require('lsp.html-ls')
require('lsp.css-ls')
require('lsp.js-ls')
require('lsp.vue-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.bash-ls')
require('lsp.vim-ls')
require('lsp.docker-ls')
require('lsp.lua-ls')
require('lsp.efm-general-ls')

require('lspkind').init({
  with_text = false,
  symbol_map = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Variable = '[]',
    Class = '  ',
    Interface = ' 蘒',
    Module = '  ',
    Property = '  ',
    Unit = ' 塞 ',
    Value = '  ',
    Enum = ' 練',
    Keyword = '  ',
    Snippet = '  ',
    Color = '',
    File = '',
    Folder = ' ﱮ ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  '
  }
})


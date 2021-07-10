local lua_format = {
  formatCommand = "lua-format -i --indent-width=2 --tab-width=2 --no-keep-simple-function-one-line --column-limit=120",
  formatStdin = true
}
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

if vim.fn.glob("node_modules/.bin/prettier") ~= "" then
  prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}
end

local eslint = {
  lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

if vim.fn.glob("node_modules/.bin/eslint") ~= "" then
  eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
  }
end

local languages = {
  lua = {lua_format},
  html = {prettier},
  css = {prettier},
  javascript = {prettier, eslint},
  vue = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  scss = {prettier},
  markdown = {prettier}
}
if not require("utils").check_lsp_client_active "efm" then
  require("lspconfig").efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = vim.tbl_keys(languages),
    settings = {rootMarkers = {".git/"}, languages = languages}
  }
end

local lua_format = {
  formatCommand = "lua-format -i --indent-width=2 --tab-width=2 --no-keep-simple-function-one-line --column-limit=120",
  formatStdin = true
}

local languages = {lua = {lua_format}}
if not require("utils").check_lsp_client_active "efm" then
  require("lspconfig").efm.setup {
    -- init_options = {initializationOptions},
    cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = vim.tbl_keys(languages),
    settings = {rootMarkers = {".git/"}, languages = languages}
  }
end

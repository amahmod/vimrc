CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"
HOME = vim.fn.expand "$HOME"

-- Global options
O = {
  transparent_window = false,
  number = true,
  relative_number = true,
  clipboard = "unnamedplus",
  colorscheme = "zephyr",
  leader_key = "space",
  document_highlight = true,
  cmdheight = 2,
  hidden_files = true,
  hl_search = false,
  ignore_case = true,
  scrolloff = 0,
  smart_case = true,
  timeoutlen = 400,
  cursorline = true,
  number_width = 4,
  wrap_lines = false,

  lsp = {popup_border = "single"},
  lang = {
    lua = {
      diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
      autoformat = true
    }
  }
}

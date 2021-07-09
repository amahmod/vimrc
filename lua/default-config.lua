ONFIG_PATH = vim.fn.stdpath "config"
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
  plugin = {
    ts_context_commentstring = {active = false},
    ts_hintobjects = {active = false},
    ts_autotag = {active = true},
    ts_rainbow = {active = false},
    ts_textobjects = {active = true},
    ts_textsubjects = {active = false},
    telescope_media = {active = true},
    telescope_fzy = {active = false},
    telescope_project = {active = false},
  },
  lang = {
    lua = {
      diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
      autoformat = true
    }
  },
  -- TODO: test textobject all keybindings
  treesitter = {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enabled = true},
    -- The below are for treesitter-textobjects plugin
    textobj_prefixes = {
      goto_next = "]", -- Go to next
      goto_previous = "[", -- Go to previous
      inner = "i", -- Select inside
      outer = "a", -- Selct around
      swap = "<leader>a" -- Swap with next
    },
    textobj_suffixes = {
      -- Start and End respectively for the goto keys
      -- for other keys it only uses the first
      ["function"] = {"f", "F"},
      ["class"] = {"m", "M"},
      ["parameter"] = {"a", "A"},
      ["block"] = {"k", "K"},
      ["conditional"] = {"i", "I"},
      ["call"] = {"c", "C"},
      ["loop"] = {"l", "L"},
      ["statement"] = {"s", "S"},
      ["comment"] = {"/", "?"}
    },
    -- The below is for treesitter hint textobjects plugin
    hint_labels = {"h", "j", "f", "d", "n", "v", "s", "l", "a"}
  }
}

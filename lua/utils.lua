local api = vim.api
local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, {
      noremap = true,
      silent = true,
      expr = false
  })

  api.nvim_set_keymap(mode, key, result, opts)
end

return U
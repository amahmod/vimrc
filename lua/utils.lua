_G.Util = {}

local fn = vim.fn
local home = os.getenv("HOME")
local user = os.getenv("USER")
local path_sep = Util.is_windows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname

Util.set_keymap = function(mode, key, value, options)
  options = options or {noremap = true, silent = true}
  vim.api.nvim_set_keymap(mode, key, value, options)
end

Util.set_buf_keymap = function(mode, key, value, options)
  options = options or {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, mode, key, value, options)
end

Util.is_cfg_present = function(cfg_name)
  -- this returns 1 if it's not present and 0 if it's present
  -- we need to compare it with 1 because both 0 and 1 is `true` in lua
  return fn.empty(fn.glob(vim.loop.cwd() .. cfg_name)) ~= 1
end

return Util

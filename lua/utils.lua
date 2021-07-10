_G.Util = {}

local fn = vim.fn

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

Util.check_lsp_client_active = function(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do if client.name == name then return true end end
  return false
end

Util.define_augroups = function(definitions)
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  -- Example
  -- define_augroups {
  --   _user_autocommands = O.user_autocommands,
  --   _general_settings = {
  --     {
  --       "TextYankPost",
  --       "*",
  --       "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
  --     },
  --     {
  --       "BufWinEnter",
  --       "*",
  --       "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
  --     },
  --   }

  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

Util.reload_config = function()
  vim.cmd "source ~/.config/nvim/init.lua"
  vim.cmd ":PackerCompile"
  vim.cmd ":PackerInstall"
end

return Util

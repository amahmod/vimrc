" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { 'require("plugins._treesitter")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/amahmod/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/amahmod/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/amahmod/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-cursorword"] = {
    config = { 'require("plugins._cursorword")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/home/amahmod/.local/share/nvim/site/pack/packer/opt/vim-cursorword"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: fzf.vim
loadstring("\27LJ\2\n±\5\0\0\4\0\16\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0'\3\6\0B\0\3\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\a\0005\1\f\0005\2\v\0=\2\r\1=\1\n\0006\0\0\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0‰\2 command! -bang -nargs=* LinesWithPreview  call fzf#vim#grep('rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,  fzf#vim#with_preview({'options': '--delimiter : --nth 4.. '}, 'up:50%', '?'), 1) \bcmd\vwindow\1\0\0\1\0\2\nwidth\4š³æÌ\t™³¦ÿ\3\vheight\4š³æÌ\t™³¦ÿ\3\15fzf_layout\14right:60%\23fzf_preview_window\6gW--reverse --preview  'bat --color=always --style=header,grid --line-range :300 {}'\21FZF_DEFAULT_OPTSXrg --files --hidden --follow --no-ignore-vcs -g  \"!{node_modules,.git,dist,.cache}\"\24FZF_DEFAULT_COMMAND\vsetenv\afn\bvim\0")()
-- Config for: nvim-colorizer.lua
require("plugins._colorizer")
-- Config for: nvim-lspconfig
require("lsp")
-- Config for: vim-easymotion
loadstring("\27LJ\2\nä\1\0\0\2\0\t\0\0216\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0K\0\1\0 EasyMotion_use_smartsign_us\25EasyMotion_smartcase\17fjdkswbeoavn\20EasyMotion_keys\17Jump to â†’ \22EasyMotion_prompt\26EasyMotion_do_mapping\6g\bvim\0")()
-- Config for: completion-nvim
require("plugins._completion")
-- Config for: vim-gitgutter
require("plugins._gitgutter")
-- Config for: nvim-bufferline.lua
loadstring("\27LJ\2\n™\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\22buffer_close_icon\5\27always_show_bufferline\1\18modified_icon\bâœ¥\rmappings\2\nsetup\15bufferline\frequire\0")()
-- Config for: vista.vim
loadstring("\27LJ\2\n—\3\0\0\4\0\14\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0)\3\1\0B\0\3\0016\0\0\0009\0\4\0)\1\1\0=\1\5\0006\0\0\0009\0\4\0'\1\a\0=\1\6\0006\0\0\0009\0\4\0'\1\t\0=\1\b\0006\0\0\0009\0\4\0'\1\v\0=\1\n\0006\0\0\0009\0\4\0005\1\r\0=\1\f\0K\0\1\0\1\0\5\15typescript\rnvim_lsp\vpandoc\rmarkdown\fvimwiki\rmarkdown\rmarkdown\btoc\20typescriptreact\rnvim_lsp\24vista_executive_for\rmarkdown\28vista_vimwiki_executive\17floating_win\31vista_echo_cursor_strategy\nctags\28vista_default_executive\29vista_disable_statusline\6g\31vista#renderer#enable_icon\17nvim_set_var\bapi\bvim\0")()
-- Config for: galaxyline.nvim
require("plugins._statusline")
-- Config for: nvim-tree.lua
require("plugins._nvim-tree")
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  au VimEnter * ++once call s:load(['nvim-treesitter'], { "event": "VimEnter *" })
  au BufReadPre,BufNewFile * ++once call s:load(['vim-cursorword'], { "event": "BufReadPre,BufNewFile *" })
augroup END

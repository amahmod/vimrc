require('nvim-autopairs').setup()

local pairs_map = {["'"] = "'", ['"'] = '"', ['('] = ')', ['['] = ']', ['{'] = '}', ['`'] = '`'}
local disable_filetype = {"TelescopePrompt"}
local break_line_filetype = nil -- mean all file type
local html_break_line_filetype = {'html', 'vue', 'typescriptreact', 'svelte', 'javascriptreact'}
local ignored_next_char = "%w"

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(function()
        vim.fn["compe#confirm"]("<cr>")
      end, 20)
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end

remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', {expr = true, noremap = true})

-- MUtils.tab = function()
--   if vim.fn.pumvisible() ~= 0 then
--     return npairs.esc("<C-n>")
--   else
--     if vim.fn["vsnip#available"](1) ~= 0 then
--       vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
--       return npairs.esc("")
--     else
--       return npairs.esc("<Tab>")
--     end
--   end
-- end
--
-- MUtils.s_tab = function()
--   if vim.fn.pumvisible() ~= 0 then
--     return npairs.esc("<C-p>")
--   else
--     if vim.fn["vsnip#jumpable"](-1) ~= 0 then
--       vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
--       return npairs.esc("")
--     else
--       return npairs.esc("<C-h>")
--     end
--   end
-- end
--
-- imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
-- imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})

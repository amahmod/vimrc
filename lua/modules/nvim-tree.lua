vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_ignore_ft = 'startify' -- "empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_hide_dotfiles = 0 -- "0 by default, this option hides files and folders starting with a dot `.`
-- vim.g.nvim_tree_hide_dotfiles = 0 -- "0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} -- "empty by default, don't auto open tree on specific filetypes.

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  {key = {"l", "<CR>", "o"}, cb = tree_cb "edit"}, {key = "h", cb = tree_cb "close_node"},
  {key = "v", cb = tree_cb "vsplit"}
}
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
  folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}


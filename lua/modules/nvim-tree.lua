local g = vim.g

g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_indent_markers = 1

g.nvim_tree_bindings = {
  edit_vsplit = 'v',
  edit_split = 's'
}
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✚",
    staged = "✚",
    unmerged = "≠",
    renamed = "≫",
    untracked = "★"
  }
}

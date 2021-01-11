require('telescope').setup{
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
  }
}

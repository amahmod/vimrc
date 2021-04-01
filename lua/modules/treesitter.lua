vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = {enable = true},
  indent = {enable = {"javascriptreact", "vue"}},
  autotag = {enable = true},
  rainbow = {enable = true},
  context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}},
  refactor = {highlight_definitions = {enable = true}, highlight_current_scope = {enable = true}},
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"},
      goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"},
      goto_previous_start = {["[m"] = "@function.outer", ["[["] = "@class.outer"},
      goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}
    },
    lsp_interop = {enable = true, peek_definition_code = {["df"] = "@function.outer", ["dF"] = "@class.outer"}}
  }
}

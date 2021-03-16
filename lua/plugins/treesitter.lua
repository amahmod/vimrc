vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
    },
  ensure_installed = 'all'
}

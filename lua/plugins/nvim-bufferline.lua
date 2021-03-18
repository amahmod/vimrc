require'bufferline'.setup{
  options = {
    numbers = "ordinal",
    mappings = true,
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end
  }
}

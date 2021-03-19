local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    local opts = {noremap = true, silent = true}
    print('LSP started')
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
    end
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-I>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-I>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

end

return lsp_config

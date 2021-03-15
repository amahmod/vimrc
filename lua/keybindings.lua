local map = function(mode, key, value)
  vim.api.nvim_set_keymap(mode,key,value,{noremap = true, silent = true});
end

-- General Keybindings
map('n', '<leader>s', ':w<CR>')
map('n', '<leader>x', ':x<CR>')
map('n', '<leader>wq', ':wq!<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>Y', ':y$<CR>')
map('n', '<leader>gp', '`[v`]<CR>')
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>')
map('n', '<leader>ba', ':bufdo bd<CR>')
map('n', '<leader>ws', ':sp<CR>')
map('n', '<leader>wv', ':vs<CR>')
map("n", "<leader>wH",'<C-w>H')
map("n", "<leader>wJ",'<C-w>J')
map("n", "<leader>wK",'<C-w>K')
map("n", "<leader>wL",'<C-w>L')
map("n", "<leader>wx",'<C-w>x')
map("n", "<leader>wc",'<C-w>c')
map("n", "<leader>wo",'<C-w>o')
map("n", "<leader>wR",'<C-w>R')

map("n","]b",':bp<CR>')
map("n", "[b",':bn<CR>')
map("n", "]w", 'WhitespaceNext')
map("n", "[w",'WhitespacePrev')
map("n", "<C-w>[",'vertical resize -5')
map("n", "<C-w>]", 'vertical resize +5')
map("n", "<Leader>S",'SessionSave')
map("n", "<Leader>Sl",'SessionLoad')
map("n", "<CR>",'nohlsearch')



------------------------------------
--  PLUGIN SPECIFIC KEYBINDINGS
------------------------------------

-- Barbar (https://github.com/romgrk/barbar.nvim)
map('n', '<TAB>',':BufferNext<CR>')
map('n', '<S-TAB>', ':BufferPrevious<CR>')
map('n', '<C-s>', ':BufferPick<CR>')
map('n', '<leader>1', ':BufferGoto 1<CR>')
map('n', '<leader>2', ':BufferGoto 2<CR>')
map('n', '<leader>3', ':BufferGoto 3<CR>')
map('n', '<leader>4', ':BufferGoto 4<CR>')
map('n', '<leader>5', ':BufferGoto 5<CR>')
map('n', '<leader>6', ':BufferGoto 6<CR>')

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
map('n','<C-p>',':Telescope find_files<CR>')
map('n','<leader>fg',':Telescope git_files<CR>')
map('n','<leader>fw',':Telescope current_buffer_fuzzy_find<CR>')
map('n','<leader>fW',':Telescope live_grep<CR>')
map('n','<leader>pw',':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
map('n','<leader>fb',':Telescope buffers<CR>')
map('n','<leader>fc',':Telescope commands<CR>')
map('n','<leader>f:',':Telescope command_history<CR>')
map('n','<leader>ff',':Telescope oldfiles<CR>')
map('n','<leader>ft',':Telescope current_buffer_tags<CR>')
map('n','<leader>fT',':Telescope tags<CR>')
map('n','<leader>fm',':Telescope marks<CR>')
map('n','<leader>tc',':Telescope colorscheme<CR>')
map('n','<leader>fq',':Telescope quickfix<CR>')
map('n','<leader>fl',':Telescope current_buffer_fuzzy_find<CR>')
map('n','<leader>fr',':Telescope lsp_references<CR>')
map('n','<leader>fs',':Telescope lsp_document_symbols<CR>')
map('n','<leader>fS',':Telescope lsp_workspace_symbols<CR>')
map('n','<leader>fa',':Telescope lsp_code_actions<CR>')
map('n','<leader>fA',':Telescope lsp_range_code_actions<CR>')
map('n','<leader>gc',':Telescope git_commits<CR>')
map('n','<leader>gb',':Telescope git_branches<CR>')
map('n','<leader>gs',':Telescope git_status<CR>')
map('n','<leader>fo',':Telescope treesitter<CR>')




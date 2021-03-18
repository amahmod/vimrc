local map = function(mode, key, value)
  vim.api.nvim_set_keymap(mode,key,value,{noremap = true, silent = true});
end

-- General Keybindings
map('n', '<leader>s', ':w<CR>')
map('n', '<leader>x', ':bw<CR>')
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
map("n", "<C-w>[",':vertical resize -5')
map("n", "<C-w>]", ':vertical resize +5')
map("n", "<CR>",':nohlsearch<CR>')


------------------------------------
--  PLUGIN SPECIFIC KEYBINDINGS
------------------------------------

-- Nvim Bufferline
map('n', 'bn', ':BufferLineCycleNext<CR>')
map('n', 'bp', ':BufferLineCyclePrev<CR>')
map('n', 'be', ':BufferLineSortByExtension<CR>')
map('n', 'bd', ':BufferLineSortByDirectory<CR>')
map('n', 'bb', ':BufferLinePick<CR>')

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

--  Gitgutter
map('n', ']h', ':GitGutterNextHunk<CR>')
map('n', '[h', ':GitGutterPrevHunk<CR>')
map('n', '<leader>hf', ':GitGutterFold<CR>')
map('n', '<leader>th', ':GitGutterLineHighlightsToggle<CR>')
map('n', '<leader>hs', ':GitGutterStageHunk<CR>')
map('n', '<leader>hu', ':GitGutterUndoHunk<CR>')
map('n', '<leader>hp', ':GitGutterPreviewHunk<CR>')


-- Accelerated_jk
vim.api.nvim_set_keymap("n", "j", '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap("n", "k", '<Plug>(accelerated_jk_gk)', {})

-- Plugin fugitive
map("n", "<leader>ga",':Git add %:p<CR>')
map("n","<leader>gg",':Git<CR>')
map("n","<leader>gd",':Gdiffsplit<CR>')
map("n","<leader>ge",':Gedit<CR>')
map("n","<leader>gr",':Gread<CR>')
map("n","<leader>gw",':Gwrite<CR>')
map("n","<leader>gB",':Git blame<Cr>')
-- ["n|<leader>gb"]        = map_cr('Git branch'):with_silent(),
map("n","<leader>gf",':Gfetch<CR>')
map("n","<leader>gl",':Git log<CR>')

-- Vista
map('n', '<leader>to', ':Vista!!<CR>')

-- Prettier
map('n', '<leader>F', ':Prettier<CR>')

-- EasiAlign
map('n', 'ga', ':EasyAlign<CR>')
map('v', 'ga', ':EasyAlign<CR>')
map('x', 'ga', ':EasyAlign<CR>')

-- JsDoc
vim.api.nvim_set_keymap("n", "<leader>d", '<Plug>(jsdoc)', {})

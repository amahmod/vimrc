local map = require('utils').set_keymap

-- Set leader
if O.leader_key == " " or O.leader_key == "space" then
  vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})
  vim.g.mapleader = " "
else
  vim.api.nvim_set_keymap("n", O.leader_key, "<NOP>", {noremap = true, silent = true})
  vim.g.mapleader = O.leader_key
end

-- General Keybindings
map('n', '<leader>s', ':w<CR>') -- save file
map('n', '<leader>wq', ':wq!<CR>') -- save and close buffer
map('n', '<leader>q', ':q!<CR>') -- force close buffer without saving
map('n', 'Y', 'y$<CR>') -- copy till end of the line
map('n', '<leader>gp', '`[v`]<CR>') -- visually select pasted content
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>') -- close all buffer except current one
map('n', '<leader>ba', ':bufdo bd<CR>') -- close all buffer

-- split window
map('n', '<leader>ws', ':sp<CR>') -- split horizontally
map('n', '<leader>wv', ':vs<CR>') -- split vertically

-- better window movement
map("n", "<leader>wH", '<C-w>H')
map("n", "<leader>wJ", '<C-w>J')
map("n", "<leader>wK", '<C-w>K')
map("n", "<leader>wL", '<C-w>L')
map("n", "<leader>wx", '<C-w>x')
map("n", "<leader>wc", '<C-w>c')
map("n", "<leader>wo", '<C-w>o')
map("n", "<leader>wR", '<C-w>R')

-- navigate through buffers
map("n", "]b", ':bp<CR>') -- go to next buffer
map("n", "[b", ':bn<CR>') -- go to previous buffer

-- resize with arrows
map("n", "<C-Right>", ':vertical resize -2<CR>')
map("n", "<C-Left>", ':vertical resize +2<CR>')
map("n", "<C-Up>", ':resize -2<CR>')
map("n", "<C-Down>", ':resize +2<CR>')

-- hide search highlight
map("n", "<leader>th", ':nohlsearch<CR>')

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- switch to normal mode by jj,jk,kj
map("i", "jj", '<esc>')
map("i", "jk", '<esc>')
map("i", "kj", '<esc>')

-- Toggle line numbers
map('n', '<leader>tn', ':set nonumber!<CR>')
-- Toggle relative line numbers
map('n', '<leader>tr', ':set norelativenumber!<CR>')

map('n', '<leader>tc', ':set conceallevel=0<CR>')

-- Quickfix
map('n', '<leader>ax', ':cclose<CR>')
map('n', '<leader>aj', ':cnext<CR>')
map('n', '<leader>ak', ':cprevious<CR>')


------------------------------------
--  PLUGIN SPECIFIC KEYBINDINGS
-----------------------------------

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader>?', ':NvimTreeFindFile<CR>')


-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<leader>.', ':Telescope filetypes<CR>')
map('n', '<leader>fa', ':Telescope lsp_code_actions<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>b?', ':Telescope buffers<CR>')
map('n', '<leader>fB', ':Telescope git_branches<CR>')
map('n', '<leader>fc', ':Telescope commands<CR>')
map('n', '<leader>fC', ':Telescope git_commits<CR>')
map('n', '<leader>fd', ':Telescope lsp_document_diagnostics<CR>')
map('n', '<leader>fD', ':Telescope lsp_workspace_diagnostics<CR>')
map('n', '<leader>ff', ':Telescope git_files<CR>')
map('n', '<leader>fh:', ':Telescope command_history<CR>')
map('n', '<leader>fi:', ':Telescope medai_files<CR>')
map('n', '<leader>fm:', ':Telescope marks<CR>')
map('n', '<leader>fM:', ':Telescope man_pages<CR>')
map('n', '<leader>fo', ':Telescope oldfiles<CR>')
map('n', '<leader>fq', ':Telescope quickfix<CR>')
map('n', '<leader>fr:', ':Telescope registers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>fS', ':Telescope lsp_workspace_symbols<CR>')
map('n', '<leader>fw:', ':Telescope live_grep<CR>')
map('n', '<leader>fW', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
map('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>fu', ':Telescope colorscheme<CR>')

--  Gitgutter
map('n', '<leader>gn', ':GitGutterNextHunk<CR>')
map('n', '<leader>gp', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gf', ':GitGutterFold<CR>')
map('n', '<leader>gh', ':GitGutterLineHighlightsToggle<CR>')
map('n', '<leader>gs', ':GitGutterStageHunk<CR>')
map('n', '<leader>gu', ':GitGutterUndoHunk<CR>')
map('n', '<leader>gP', ':GitGutterPreviewHunk<CR>')

-- Fugitive
map("n", "<leader>gg", ':Git<CR>')
map("n", "<leader>gd", ':Git diff<CR>')
map("n", "<leader>gD", ':Gdiffsplit<CR>')
map("n", "<leader>ge", ':Gedit<CR>')
map("n", "<leader>gr", ':Gread<CR>')
map("n", "<leader>gw", ':Gwrite<CR>')
map("n", "<leader>gB", ':Git blame<Cr>')
map("n", "<leader>gl", ':Git log<CR>')
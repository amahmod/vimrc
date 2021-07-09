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

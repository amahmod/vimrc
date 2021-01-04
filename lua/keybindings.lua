local U = require "utils"

U.map("n", "<leader>rv", ":source $MYVIMRC<CR>")

-- save current buffer
U.map("n", "<leader>s", ":w<CR>")
-- close current buffer
U.map("n", "<leader>x", ":bw<CR>")
-- save and close current window
U.map("n", "<leader>wq", ":wq!<CR>")
-- force close without saving
U.map("n", "<leader>q", ":q!<CR>")
-- copy to the end of the line
U.map("n", "Y", "y$")
-- visually select what just pasted
U.map("n", "gp", "`[v`]")
-- toggle conceallevel on/off
U.map("n", "<leader>tl", ':exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>')
-- close all buffers except current one
U.map("n", "<leader>bo", ":w <bar> %bd <bar> e# <bar> bd# <CR>")
-- close all buffers
U.map("n", "<leader>ba", ":bufdo bd<CR>")

-- Window split and movement
U.map("n", "<leader>ws", ":<C-u>sp<CR>")
U.map("n", "<leader>wv", ":<C-u>vs<CR>")
U.map("n", "<leader>wH", "<C-w>H")
U.map("n", "<leader>wJ", "<C-w>J")
U.map("n", "<leader>wK", "<C-w>K")
U.map("n", "<leader>wL", "<C-w>L")
U.map("n", "<leader>wx", "<C-w>x")
U.map("n", "<leader>wc", "<C-w>c")
U.map("n", "<leader>wo", "<C-w>o")
U.map("n", "<leader>wR", "<C-w>R")
-- vscodeで、j, kが動作しない場合は、で、
-- defaults write -g ApplePressAndHoldEnabled -bool false
-- リーダーキーの設定
vim.g.mapleader = ';'

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><ESC>', {})

-- 矩形選択
vim.api.nvim_set_keymap('n', '<Leader>v', '<C-v>', {noremap = true})
vim.api.nvim_set_keymap('x', '<Leader>v', '<C-v>', {noremap = true})
vim.api.nvim_set_keymap('o', '<Leader>v', '<C-v>', {noremap = true})

-- 全選択
vim.api.nvim_set_keymap('n', 'vv', 'G$Vgg0', {noremap = true})

-- ノーマルモードのキーマッピング
vim.api.nvim_set_keymap('n', 'dx', 'dd', {noremap = true})
vim.api.nvim_set_keymap('n', 'dd', '"_dd', {noremap = true})
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true})
vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap = true})
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap = true})
vim.api.nvim_set_keymap('n', 'C', '"_C', {noremap = true})
vim.api.nvim_set_keymap('n', 'S', '"_S', {noremap = true})
vim.api.nvim_set_keymap('n', 's', '"_s', {noremap = true})
vim.api.nvim_set_keymap('n', 'm', '^', {noremap = true})
vim.api.nvim_set_keymap('n', '^', '+', {noremap = true})

-- ビジュアルモードのキーマッピング
vim.api.nvim_set_keymap('x', 'd', '"_d', {noremap = true})
vim.api.nvim_set_keymap('x', 'c', '"_c', {noremap = true})
vim.api.nvim_set_keymap('x', 'D', '"_D', {noremap = true})
vim.api.nvim_set_keymap('x', 'C', '"_C', {noremap = true})
vim.api.nvim_set_keymap('x', 'S', '"_S', {noremap = true})
vim.api.nvim_set_keymap('x', 's', '"_s', {noremap = true})
vim.api.nvim_set_keymap('x', 'm', '^', {noremap = true})
vim.api.nvim_set_keymap('x', '^', '+', {noremap = true})

-- オペレータモードのキーマッピング
vim.api.nvim_set_keymap('o', 'd', '"_d', {noremap = true})
vim.api.nvim_set_keymap('o', 'c', '"_c', {noremap = true})
vim.api.nvim_set_keymap('o', 'D', '"_D', {noremap = true})
vim.api.nvim_set_keymap('o', 'C', '"_C', {noremap = true})
vim.api.nvim_set_keymap('o', 'S', '"_S', {noremap = true})
vim.api.nvim_set_keymap('o', 's', '"_s', {noremap = true})
vim.api.nvim_set_keymap('o', 'm', '^', {noremap = true})
vim.api.nvim_set_keymap('o', '^', '+', {noremap = true})

-- ノーマル、ビジュアル、オペレータモードでのキーマッピング
vim.api.nvim_set_keymap('n', 'o', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('x', 'o', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('o', 'o', 'o<Esc>', {noremap = true})

vim.api.nvim_set_keymap('n', 'O', 'O<Esc>', {noremap = true})
vim.api.nvim_set_keymap('x', 'O', 'O<Esc>', {noremap = true})
vim.api.nvim_set_keymap('o', 'O', 'O<Esc>', {noremap = true})

vim.api.nvim_set_keymap('n', '(', 'i<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('x', '(', 'i<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('o', '(', 'i<Space><Esc>', {noremap = true})

vim.api.nvim_set_keymap('n', ')', 'a<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('x', ')', 'a<Space><Esc>', {noremap = true})
vim.api.nvim_set_keymap('o', ')', 'a<Space><Esc>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Space>', '$', {noremap = true})
vim.api.nvim_set_keymap('x', '<Space>', '$', {noremap = true})
vim.api.nvim_set_keymap('o', '<Space>', '$', {noremap = true})

vim.api.nvim_set_keymap('n', 'J', '10j', {noremap = true})
vim.api.nvim_set_keymap('x', 'J', '10j', {noremap = true})
vim.api.nvim_set_keymap('o', 'J', '10j', {noremap = true})

vim.api.nvim_set_keymap('n', 'K', '10k', {noremap = true})
vim.api.nvim_set_keymap('x', 'K', '10k', {noremap = true})
vim.api.nvim_set_keymap('o', 'K', '10k', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<C-e>', '10<C-e>', {noremap = true})
-- vim.api.nvim_set_keymap('x', '<C-e>', '10<C-e>', {noremap = true})
-- vim.api.nvim_set_keymap('o', '<C-e>', '10<C-e>', {noremap = true})

-- クリップボード設定
set clipboard+=unnamedplus


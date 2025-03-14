-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic: Go to previous message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic: Go to next message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic: Show Error messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic: Open Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-S-h>', [[<cmd>vertical resize -5<cr>]], { desc = 'Make the window smaller vertically' })
vim.keymap.set('n', '<C-S-l>', [[<cmd>vertical resize +5<cr>]], { desc = 'Make the window biger vertically' })
vim.keymap.set('n', '<C-S-j>', [[<cmd>horizontal resize -2<cr>]], { desc = 'Make the window smaller horizontally' })
vim.keymap.set('n', '<C-S-k>', [[<cmd>horizontal resize +2<cr>]], { desc = 'Make the window bigger horizontally' })

-- Open current buffer in new tab
vim.api.nvim_set_keymap('n', '<leader>ts', ':tabedit %<CR>', { desc = 'Open current buffer in new tab', noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
vim.keymap.set('n', '<leader>m', ':MaximizerToggle<cr>', { desc = 'Maximizer: Maximize current window' })
-- disable default mappings for maximizer
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_mapping_with_bang = 0

-- vim: ts=2 sts=2 sw=2 et

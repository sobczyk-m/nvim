return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup { default_mappings = false }
    vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)', { desc = 'Git Conflict: Choose ours' })
    vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)', { desc = 'Git Conflict: Choose theirs' })
    vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)', { desc = 'Git Conflict: Choose both' })
    vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)', { desc = 'Git Conflict: Choose none' })
    vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = 'Git Conflict: Previous conflict' })
    vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = 'Git Conflict: Next conflict' })
  end,
}

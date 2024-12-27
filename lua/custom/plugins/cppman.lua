return {
  'madskjeldgaard/cppman.nvim',

  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    local cppman = require 'cppman'
    cppman.setup()

    -- Make a keymap to open the word under cursor in CPPman
    vim.keymap.set('n', '<leader>csw', function()
      cppman.open_cppman_for(vim.fn.expand '<cword>')
    end, { desc = 'CPPman: word under cursor' })

    -- Open search box
    vim.keymap.set('n', '<leader>csb', function()
      cppman.input()
    end, { desc = 'CPPman: search box' })
  end,
}

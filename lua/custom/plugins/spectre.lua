return {
  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    cmd = { 'Spectre' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('spectre').setup {
        vim.keymap.set('n', '<leader>S', '', {
          desc = 'Spectre: open',
        }),
        vim.keymap.set('n', '<leader>St', '<cmd>lua require("spectre").toggle()<CR>', {
          desc = 'Spectre: Toggle ',
        }),
        vim.keymap.set('n', '<leader>Sg', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
          desc = 'Spectre: Search Globally',
        }),
        vim.keymap.set('v', '<leader>Sg', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
          desc = 'Spectre: Search Globally',
        }),
        vim.keymap.set('n', '<leader>Sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
          desc = 'Spectre: Search on current File',
        }),
        vim.keymap.set('v', '<leader>Sf', '<esc><cmd>lua require("spectre").open_file_search()<CR>', {
          desc = 'Spectre: Search on current File',
        }),
        highlight = {
          search = 'SpectreSearch',
          replace = 'SpectreReplace',
        },
      }
      vim.cmd 'highlight SpectreSearch guifg=#282C34'
      vim.cmd 'highlight SpectreReplace guifg=#282C34'
      vim.cmd 'highlight SpectreSearch guibg=#E06C75'
      vim.cmd 'highlight SpectreReplace guibg=#98C379'
    end,
  },
}

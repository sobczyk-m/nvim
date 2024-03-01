return {
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = { "Spectre" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("spectre").setup({
        vim.keymap.set('n', '<leader>S', '', {
          desc = "[S]pectre"
        }),
        vim.keymap.set('n', '<leader>St', '<cmd>lua require("spectre").toggle()<CR>', {
          desc = "[S]pectre [T]oggle "
        }),
        vim.keymap.set('n', '<leader>Sg', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
          desc = "[S]earch [G]lobally"
        }),
        vim.keymap.set('v', '<leader>Sg', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
          desc = "[S]earch [G]lobally"
        }),
        vim.keymap.set('n', '<leader>Sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
          desc = "[S]earch on current [F]ile"
        }),
        vim.keymap.set('v', '<leader>Sf', '<esc><cmd>lua require("spectre").open_file_search()<CR>', {
          desc = "[S]earch on current [F]ile"
        }),
        highlight = {
          search = "SpectreSearch",
          replace = "SpectreReplace",
        },
      })
      vim.cmd('highlight SpectreSearch guifg=#282C34')
      vim.cmd('highlight SpectreReplace guifg=#282C34')
      vim.cmd('highlight SpectreSearch guibg=#E06C75')
      vim.cmd('highlight SpectreReplace guibg=#98C379')
    end,
  },
}

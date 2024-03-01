return {
  "ryanmsnyder/toggleterm-manager.nvim",
  dependencies = {
    "akinsho/nvim-toggleterm.lua",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
  },

  config = function()
    vim.keymap.set('n', '<leader>\\', '<cmd>Telescope toggleterm_manager<CR>', { desc = 'Toggleterm Manager' })
    local actions = require("toggleterm-manager").actions

    require("toggleterm-manager").setup {
      mappings = {
        i = {
          ["<CR>"] = { action = actions.open_term, exit_on_action = true },
        },
      },
    }
  end,
}

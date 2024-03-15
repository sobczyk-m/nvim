return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      options = {
        -- ... your lualine config
        theme = 'tokyonight',
        -- ... your lualine config
      },
    }
    vim.cmd [[colorscheme tokyonight]]
    -- You can configure highlights by doing something like
    -- vim.cmd.hi 'Comment gui=none'
  end,
}

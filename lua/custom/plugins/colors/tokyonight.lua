return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      options = {
        theme = 'tokyonight',
      },
    }
    -- colorscheme tokyonight, tokyonight-night, tokyonight-storm, tokyonight-day ,tokyonight-moon
    -- vim.cmd [[colorscheme tokyonight-storm]]
    -- You can configure highlights by doing something like
    -- vim.cmd.hi 'Comment gui=none'
  end,
}


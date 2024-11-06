return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      -- variant = 'auto', -- auto, main, moon, or dawn
    }
    -- colorscheme kanagawa-wave kanagawa-dragon kanagawa-lotus
  end,
}


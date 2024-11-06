return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      -- Set a style preset. 'dark' is default.
      style = 'cool', -- dark, darker, cool, deep, warm, warmer, light
    }
    -- require('onedark').load()
  end,
}

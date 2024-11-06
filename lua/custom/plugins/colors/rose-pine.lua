return {
  'rose-pine/neovim',
  name = 'rose-pine-moon',
  lazy = false,
  priority = 1000,
  config = function()
    require('rose-pine').setup {
      styles = {
        bold = false,
        -- italic = false,
      },
    }
    -- colorscheme rose-pine rose-pine-moon rose-pine-dawn
  end,
}


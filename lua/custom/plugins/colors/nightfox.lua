return {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup {}
      -- colorscheme nightfox, duskfox, terafox, carbonfox, nordfox
    end,
  }
  
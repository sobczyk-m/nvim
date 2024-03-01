return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      options = {
        -- ... your lualine config
        theme = 'tokyonight'
        -- ... your lualine config
      },
    })
    vim.cmd [[colorscheme tokyonight]]
  end,
}

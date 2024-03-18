-- Tokyonight
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
    -- colorscheme tokyonight, tokyonight-night, tokyonight-storm, tokyonight-day ,tokyonight-moon
    vim.cmd [[colorscheme tokyonight]]
    -- You can configure highlights by doing something like
    -- vim.cmd.hi 'Comment gui=none'
  end,
}

-- Onedark
-- return {
--   'navarasu/onedark.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('onedark').setup {
--       -- Set a style preset. 'dark' is default.
--       style = 'deep', -- dark, darker, cool, deep, warm, warmer, light
--     }
--     require('onedark').load()
--   end,
-- }

-- Catppuccino
-- return {
--   'catppuccin/nvim',
--   config = function()
--     require('catppuccin').setup {
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         harpoon = true,
--         illuminate = true,
--         indent_blankline = {
--           enabled = false,
--           scope_color = 'sapphire',
--           colored_indent_levels = false,
--         },
--         -- mason = true,
--         native_lsp = { enabled = true },
--         notify = true,
--         nvimtree = true,
--         neotree = true,
--         symbols_outline = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--       },
--     }
--
--     -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
--     vim.cmd.colorscheme 'catppuccin-macchiato'
--   end,
-- }

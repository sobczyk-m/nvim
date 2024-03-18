-- nightfox
return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nightfox').setup {}
    -- colorscheme nightfox, duskfox, terafox, carbonfox, nordfox
    vim.cmd 'colorscheme duskfox'
  end,
}

-- - Rose Pine
-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('rose-pine').setup {
--       styles = {
--         bold = false,
--         -- italic = false,
--       },
--     }
--     -- colorscheme rose-pine rose-pine-moon rose-pine-dawn
--     vim.cmd 'colorscheme rose-pine-moon'
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
--     -- catppuccin-frappe, catppuccin-mocha, catppuccin-macchiato, catppuccin-latte,
--     vim.cmd.colorscheme 'catppuccin-frappe'
--   end,
-- }

-- Onedark
-- return {
--   'navarasu/onedark.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('onedark').setup {
--       -- Set a style preset. 'dark' is default.
--       style = 'cool', -- dark, darker, cool, deep, warm, warmer, light
--     }
--     require('onedark').load()
--   end,
-- }

-- Kanagawa
-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('kanagawa').setup {
--       -- variant = 'auto', -- auto, main, moon, or dawn
--     }
--     -- colorscheme kanagawa-wave kanagawa-dragon kanagawa-lotus
--     vim.cmd 'colorscheme kanagawa-wave'
--   end,
-- }

-- Tokyonight
-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('tokyonight').setup {
--       options = {
--         -- ... your lualine config
--         theme = 'tokyonight',
--         -- ... your lualine config
--       },
--     }
--     -- colorscheme tokyonight, tokyonight-night, tokyonight-storm, tokyonight-day ,tokyonight-moon
--     vim.cmd [[colorscheme tokyonight-storm]]
--     -- You can configure highlights by doing something like
--     -- vim.cmd.hi 'Comment gui=none'
--   end,
-- }

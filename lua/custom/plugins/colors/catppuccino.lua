return {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        harpoon = true,
        illuminate = true,
        indent_blankline = {
          enabled = false,
          scope_color = 'sapphire',
          colored_indent_levels = false,
        },
        -- mason = true,
        native_lsp = { enabled = true },
        notify = true,
        nvimtree = true,
        neotree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    }

    -- catppuccin-frappe, catppuccin-mocha, catppuccin-macchiato, catppuccin-latte,
  end,
}


return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree: Reveal', silent = true },
  },
  opts = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
        ['l'] = 'focus_preview',
        ['<C-b>'] = { 'scroll_preview', config = { direction = 10 } },
        ['<C-f>'] = { 'scroll_preview', config = { direction = -10 } },
      },
    },
  },
}

return {
  'RRethy/vim-illuminate',
  event = 'BufEnter',
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
    },
    under_cursor = false,
    min_count_to_highlight = 2,
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set('n', key, function()
        require('illuminate')['goto_' .. dir .. '_reference'](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
    end

    map(']]', 'next')
    map('[[', 'prev')

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map(']]', 'next', buffer)
        map('[[', 'prev', buffer)
      end,
    })

    -- vim-illuminate highlightings
    -- Set background highlighting of matching groups instead of underlined
    local backgroundColor = '#D19A66'
    local foregroundColor = '#282C34'
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = backgroundColor, fg = foregroundColor })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = backgroundColor, fg = foregroundColor })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = backgroundColor, fg = foregroundColor })
  end,
  keys = {
    { ']]', desc = 'Illuminate: Goto Next Reference' },
    { '[[', desc = 'Illuminate: Go to Prev Reference' },
  },
}

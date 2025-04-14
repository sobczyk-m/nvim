-- Alternatively, use `config = function() ... end` for full control over the configuration.
-- If you prefer to call `setup` explicitly, use:
--    {
--        'lewis6991/gitsigns.nvim',
--        config = function()
--            require('gitsigns').setup({
--                -- Your gitsigns configuration here
--            })
--        end,
--    }
--- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigationsa
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Git: Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Git: Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: Stage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: Reset hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: Stage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git: Reset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git: Stage buffer' })
        map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'Git: Undo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git: Reset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: Preview git hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git: Blame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git: Diff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Git: diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git: Toggle git blame line' })
        map('n', '<leader>td', gitsigns.preview_hunk_inline, { desc = 'Git: Toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git: Select git hunk' })
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

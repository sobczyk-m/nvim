-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    -- the most stable branch
    -- commented out beacuase of missing mappings for horizontal scrolling
    -- return to this after the fix is merged to that branch (feat: #2437)[https://github.com/nvim-telescope/telescope.nvim/pull/2437] or (fix #2787)[https://github.com/nvim-telescope/telescope.nvim/pull/2787]
    -- (releases)[https://github.com/nvim-telescope/telescope.nvim/releases]
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            n = {
              ['<C-x>'] = require('telescope.actions').delete_buffer,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
              ['<C-f>'] = false,
              ['<C-p>'] = require('telescope.actions').preview_scrolling_left,
              ['<C-n>'] = require('telescope.actions').preview_scrolling_right,
              ['<C-h>'] = require('telescope.actions').results_scrolling_left,
              ['<C-l>'] = require('telescope.actions').results_scrolling_right,
            },
            i = {
              ['<C-x>'] = require('telescope.actions').delete_buffer,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
              ['<C-f>'] = false,
              ['<C-p>'] = require('telescope.actions').preview_scrolling_left,
              ['<C-n>'] = require('telescope.actions').preview_scrolling_right,
              ['<C-h>'] = require('telescope.actions').results_scrolling_left,
              ['<C-l>'] = require('telescope.actions').results_scrolling_right,
            },
            --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
            },
            scroll_speed = 4,
          },
        },
        pickers = {
          -- sort buffers by last used
          sort_lastused = true,
          -- ignore current buffer in list
          ignore_current_buffer = true,
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope: Help' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope: Search Keymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope: Search Files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Telescope: Search Select Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: Search current Word' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope: Search by Grep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope: Search Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope: Search Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Telescope: Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Telescope: Find Existing Buffers' })
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Telescope: Search Git Files' })
      vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = 'Telescope: Search Commands' })
      vim.keymap.set('n', '<leader>sp', require('telescope.builtin').spell_suggest, { desc = 'Telescope: Search new Phrase' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Telescope: Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Telescope: Search in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Telescope: Search Neovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

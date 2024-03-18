-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/which-key',

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart:
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
  require 'custom.plugins.copilot',
  require 'custom.plugins.copilotChat',
  -- Cmp for copilot
  -- require 'custom.plugins.copilot_cmp',
  require 'custom.plugins.conform',
  require 'custom.plugins.colorizer',
  require 'custom.plugins.color-scheme',
  require 'custom.plugins.dap-virtual-text',
  require 'custom.plugins.gp-nvim',
  require 'custom.plugins.harpoon',
  require 'custom.plugins.illuminate',
  require 'custom.plugins.indent-blankline',
  require 'custom.plugins.lualine',
  require 'custom.plugins.markdown-preview',
  require 'custom.plugins.neotree',
  require 'custom.plugins.nvim-surround',
  require 'custom.plugins.oil',
  require 'custom.plugins.symbols-outline',
  require 'custom.plugins.spectre',
  require 'custom.plugins.toggleterm',
  require 'custom.plugins.toggleterm-manager',
  require 'custom.plugins.tailwindcss-colorizer-cmp',
  require 'custom.plugins.todo-comments',
  require 'custom.plugins.ufo',
  require 'custom.plugins.undotree',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

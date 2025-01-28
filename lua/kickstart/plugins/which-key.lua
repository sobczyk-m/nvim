-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      spec = {
        -- Normal and Visual mode bindings
        { '<leader><F5>', name = '[U]ndo tree', mode = { 'n', 'v' } },
        { '<leader>c', name = '[C]ode', mode = { 'n', 'v' } },
        { '<leader>cc', name = 'Github [C]opilot [C]hat', mode = { 'n', 'v' } },
        { '<leader>ch', name = '[C]lear search [H]ighlight', mode = { 'n', 'v' } },
        { '<leader>d', name = '[D]ocument', mode = { 'n', 'v' } },
        { '<leader>g', name = '[G]it', mode = { 'n', 'v' } },
        { '<leader>h', name = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>r', name = '[R]ename', mode = { 'n', 'v' } },
        { '<leader>s', name = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>S', name = '[S]pectre', mode = { 'n', 'v' } },
        { '<leader>t', name = '[T]oggle', mode = { 'n', 'v' } },
        { '<leader>o', name = '[O]penAI', mode = { 'n', 'v' } },
        { '<leader>w', name = '[W]orkspace', mode = { 'n', 'v' } },
      },
    },
  },
}

-- vim:ts=2 sts=2 sw=2 et

return {
  'piersolenski/wtf.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  opts = {},
  keys = {
    {
      'csW',
      mode = { 'n', 'x' },
      function()
        require('wtf').ai()
      end,
      desc = 'Wtf: Debug diagnostic with AI',
    },
    {
      mode = { 'n' },
      'csw',
      function()
        require('wtf').search()
      end,
      desc = 'Wtf: Search diagnostic with Google',
    },
  },
}

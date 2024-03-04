local prompts = {
  -- Code related prompts
  Explain = 'Explain how it works.',
  Refactor = 'Refactor the code to improve its clarity and readability.',
  BetterNamings = 'Please provide better names for the following variables and functions.',
  FixCode = 'Please fix the following code to make it work as intended.',
  Documentation = 'Please provide documentation for the following code.',
  Tests = 'Explain how the selected code works, then generate unit tests for it.',
  Review = 'Review the following code and provide concise suggestions.',
  -- Text related prompts
  Summarize = 'Please summarize the following text.',
}

local function get_git_diff(staged)
  local cmd = staged and 'git diff --staged' or 'git diff'
  local handle = io.popen(cmd)
  if not handle then
    return ''
  end

  local result = handle:read '*a'
  handle:close()
  return result
end

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }, -- Use telescope for help actions
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      prompts = prompts,
      show_help = 'yes', -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language = 'English', -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
    },
    build = function()
      vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    end,
    event = 'VeryLazy',
    keys = {
      -- Show help actions with telescope
      {
        '<leader>cch',
        function()
          require('CopilotChat.code_actions').show_help_actions()
        end,
        desc = 'CopilotChat - Help actions',
      },
      -- Show prompts actions with telescope
      {
        '<leader>ccp',
        function()
          require('CopilotChat.code_actions').show_prompt_actions()
        end,
        desc = 'CopilotChat - Help actions',
      },
      {
        '<leader>ccp',
        ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
        mode = 'x',
        desc = 'CopilotChat - Prompt actions',
      },

      { '<leader>ccb', ':CopilotChatBuffer ', desc = 'CopilotChat - Chat with current buffer' },
      { '<leader>cce', '<cmd>CopilotChatExplain<cr>', desc = 'CopilotChat - Explain code' },
      { '<leader>cct', '<cmd>CopilotChatTests<cr>', desc = 'CopilotChat - Generate tests' },
      {
        '<leader>ccT',
        '<cmd>CopilotChatVsplitToggle<cr>',
        desc = 'CopilotChat - Toggle Vsplit', -- Toggle vertical split
      },
      {
        '<leader>ccv',
        ':CopilotChatVisual',
        mode = 'x',
        desc = 'CopilotChat - Open in vertical ',
      },
      {
        '<leader>ccx',
        ':CopilotChatInPlace<cr>',
        mode = 'x',
        desc = 'CopilotChat - Run in-place code',
      },
      {
        '<leader>ccf',
        '<cmd>CopilotChatFixDiagnostic<cr>', -- Get a fix for the diagnostic message under the cursor.
        desc = 'CopilotChat - Fix diagnostic',
      },
      {
        '<leader>ccr',
        '<cmd>CopilotChatReset<cr>', -- Reset chat history and clear buffer.
        desc = 'CopilotChat - Reset chat history and clear buffer',
      },
      {
        '<leader>ccd',
        '<cmd>CopilotChatDebugInfo<cr>', -- Inspect the debug information. (logs from :messages)
        desc = 'CopilotChat - Debug Info',
      },
      -- Generate commit message based on the git diff
      {
        '<leader>ccm',
        function()
          local diff = get_git_diff()
          if diff ~= '' then
            vim.fn.setreg('"', diff)
            vim.cmd 'CopilotChat Write commit message for the change'
          end
        end,
        desc = 'CopilotChat - Commit msg all changes',
      },
      {
        '<leader>ccM',
        function()
          local diff = get_git_diff(true)
          if diff ~= '' then
            vim.fn.setreg('"', diff)
            vim.cmd 'CopilotChat Write commit msg for the change'
          end
        end,
        desc = 'CopilotChat - Commit msg staged changes',
      },
      -- Custom input for CopilotChat
      {
        '<leader>cci',
        function()
          local input = vim.fn.input 'Ask Copilot: '
          if input ~= '' then
            vim.cmd('CopilotChat ' .. input)
          end
        end,
        desc = 'CopilotChat - Ask input',
      },
    },
  },
}

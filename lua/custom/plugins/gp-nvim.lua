return {
  "robitx/gp.nvim",
  config = function()
    local function keymapOptions(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT " .. desc,
      }
    end

    vim.keymap.set("n", "<leader>ot", "<cmd>GpChatToggle popup<cr>", keymapOptions("Toggle Chat"))
    vim.keymap.set("v", "<leader>ot", ":<C-u>'<,'>GpChatToggle popup<cr>", keymapOptions("Visual Popup Chat"))
    vim.keymap.set("n", "<leader>or", "<cmd>GpChatRespond<cr>", keymapOptions("Respond"))
    vim.keymap.set("n", "<leader>on", "<cmd>GpChatNew popup<cr>", keymapOptions("New Chat"))
    vim.keymap.set("v", "<leader>on", ":<C-u>'<,'>GpChatNew popup<cr>", keymapOptions("Visual New Chat"))

    require("gp").setup({
      openai_api_key = os.getenv("OPENAI_API_KEY")
    })
  end
}

return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        templ = { "templ" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },

      vim.keymap.set({ "n" }, "<leader>cf", function()
        require("conform").format({
          lsp_fallback = true,
          timeout_ms = 500,
        })
      end, { desc = "[F]ormat code in file" }),

      vim.keymap.set({ "v", }, "<leader>cf", function()
        require("conform").format({
          lsp_fallback = true,
          timeout_ms = 500,
        })
      end, { desc = "[F]ormat code in range" })
    })
  end
}

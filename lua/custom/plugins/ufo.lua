return {
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      --- @diagnostic disable: unused-local
      require("ufo").setup({
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds),
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds),
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
